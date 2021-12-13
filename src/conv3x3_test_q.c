/*==============================================================================
  Copyright (c) 2012-2014,2017,2020 Qualcomm Technologies, Inc.
  All rights reserved. Qualcomm Proprietary and Confidential.
==============================================================================*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/time.h>

#include "remote.h"
#include "os_defines.h"
#include "AEEStdErr.h"
#include "conv3x3.h"
#include "conv3x3_test.h"
#include "rpcmem.h"
//#include "ion_allocation.h"

extern const int KernelSize ;
extern const int KernelLen ;
extern const int Width , Height;
extern const int Stride;	//keep stride = width at the moment

void print_buf(const uint8* buf, int width, char* comment)
{
	printf("%s:\n",comment);
	int line = width>8?8:width;
	for(int y=0; y<line; y++){
		for(int x=0; x<line; x++)
			printf("%3d ",buf[y*width+x]);
		printf("\n");
	}
	printf("\n");
}
//src0中pad 0
int local_conv3x3(const unsigned char* src, unsigned char* dst, const unsigned char* kernel) {
	int len = sizeof(*src) * (Width+2) * (Height+2);
	int kx = 0, ky = 0, sum = 0, x = 0, y = 0;
	uint8* src0 = (uint8*)rpcmem_alloc(RPCMEM_HEAP_ID_SYSTEM, RPCMEM_DEFAULT_FLAGS, len);
	for(x=0; x<Width; x++){
	  src0[x] = 0;
	  src0[(Height+1)*(Width+2)+x] = 0;
	}
	for(y=0; y<Height+2; y++){
	  src0[y*(Width+2)] = 0;
	  src0[y*(Width+2)+Width+1] = 0;
	}
	for (y = 1; y < Height+1; y++)
		for (x = 1; x < Width+1; x++)
	  	src0[y*(Width+2)+x] = src[(y-1)*Width+x-1];
	//print_buf(src0, Width+2, "src0");
	for (y = 0; y < Height; y++)
		for (x = 0; x < Width; x++)
	  	{
	    	sum = 0;
	    	for (ky = 0; ky < KernelLen; ky++)
	    		for (kx = 0; kx < KernelLen; kx++)
	      		{
	  	  			sum+= src0[(y+ky)*(Width+2) + (x+kx)] * kernel[ky*KernelLen + kx];
	    		}
	    	dst[y*Width + x] = (unsigned char)sum;
	  	}
	rpcmem_free(src0);
	return 0;
}

void print_time(struct timeval start, struct timeval end, uint32 loop)
{
	uint64 timer = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
	timer = timer/loop;
	printf("timer = %lld us\n", timer);
}

int conv3x3_test(int runLocal, bool isUnsignedPD_Enabled, bool use_halide, uint32 loop) {
	int nErr = AEE_SUCCESS;
	unsigned char* kernel = NULL, *src = NULL, *dst = NULL;
	int ii, len = 0;
	remote_handle64 handle = -1;
	char *uri = NULL;
	int heapid = RPCMEM_HEAP_ID_SYSTEM;
	uri = conv3x3_URI CDSP_DOMAIN;
	struct timeval start, end;
	rpcmem_init();
	//alloc_init();
	
	len = sizeof(*kernel) * KernelSize;
	if (0 == (kernel = (uint8*)rpcmem_alloc(heapid, RPCMEM_DEFAULT_FLAGS, len))) {
	//if (NULL == (kernel = (uint8*)alloc_ion(len))){
	  nErr = AEE_ENORPCMEMORY;
	  printf("ERROR 0x%x: kernel memory alloc failed\n", nErr);
	  goto bail;
	}
	for (ii = 0; ii < KernelSize; ++ii)
	  kernel[ii] = ii;
	
	printf("Allocate %d bytes from ION heap\n", Width*Height);
	len = sizeof(*src) * Width * Height;
	if (0 == (src = (uint8*)rpcmem_alloc(heapid, RPCMEM_DEFAULT_FLAGS, len))) {
	//if (NULL==(src = (uint8*)alloc_ion(len))) {
	  nErr = AEE_ENORPCMEMORY;
	  printf("ERROR 0x%x: memory alloc failed\n", nErr);
	  goto bail;
	}
	for (ii = 0; ii < Width * Height; ++ii)
	  src[ii] = ii;
	
	if (0 == (dst = (uint8*)rpcmem_alloc(heapid, RPCMEM_DEFAULT_FLAGS, len))) {
	//if (NULL == (dst = (uint8*)alloc_ion(len))) {
	  nErr = AEE_ENORPCMEMORY;
	  printf("ERROR 0x%x: memory alloc failed\n", nErr);
	  goto bail;
	}
	memset(dst, 1, Width * Height);
	  
	if (runLocal) {
		printf("Compute conv3x3 locally\n");
		gettimeofday(&start, NULL);
		for(int l=0; l<loop; l++){
			if (0 != local_conv3x3(src, dst, kernel)) {
				nErr = AEE_EFAILED;
		  		printf("ERROR 0x%x: local compute sum failed\n", nErr);
		  		goto bail;
		}}
		gettimeofday(&end, NULL);
		print_time(start, end, 1);
	} 
	else {
	  if(isUnsignedPD_Enabled) {
	    if(remote_session_control) {
			printf("unsigned PD\n");
	      	struct remote_rpc_control_unsigned_module data;
	      	data.domain = CDSP_DOMAIN_ID;
	      	data.enable = 1;
	      	if (AEE_SUCCESS != (nErr = remote_session_control(DSPRPC_CONTROL_UNSIGNED_MODULE, (void*)&data, sizeof(data)))) {
	        	printf("ERROR 0x%x: remote_session_control failed\n", nErr);
	        	goto bail;
	      }
	    }
	    else {
	      nErr = AEE_EUNSUPPORTED;
	      printf("ERROR 0x%x: remote_session_control interface is not supported on this device\n", nErr);
	      goto bail;
	    }
	  }
	
	  if (AEE_SUCCESS == (nErr = conv3x3_open(uri, &handle))) {
	    printf("\nCall conv3x3 on the DSP\n");
		gettimeofday(&start, NULL);
		for(int l=0; l<loop; l++){
			if(use_halide)
			{
	    		nErr = conv3x3_halideimp(handle, src, Width, dst, Height, kernel, KernelSize);
			}
			else{
	    		nErr = conv3x3_intrinsicimp(handle, src, Width, dst, Height, kernel, KernelSize);
			}
		}
		gettimeofday(&end, NULL);
		print_time(start, end, 1);
	  }
	  if (handle != -1) {
	    if (AEE_SUCCESS != (nErr = conv3x3_close(handle))) {
	      printf("ERROR 0x%x: Failed to close handle\n", nErr);
	    }
	  }
	}
	print_buf(kernel, KernelLen,"kernel");
	print_buf(src, Width, "src");
	print_buf(dst, Width, "dst");
bail:
  if (kernel) {
    rpcmem_free(kernel);
    rpcmem_free(src);
    rpcmem_free(dst);
	//alloc_ion_free(kernel);
	//alloc_ion_free(src);
	//alloc_ion_free(dst);
  }
  rpcmem_deinit();
  return nErr;
}
