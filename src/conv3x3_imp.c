/*==============================================================================
  Copyright (c) 2012-2014, 2020 Qualcomm Technologies, Inc.
  All rights reserved. Qualcomm Proprietary and Confidential.
==============================================================================*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "HAP_farf.h"
#include "conv3x3.h"
#include "conv3x3_per1row.h"
#include "conv3x3_per2row.h"
#include "conv3x3_per4row.h"
#include "conv3x3_halide.h"
#include "HAP_perf.h"
#include "q6cache.h"

#define AHEAD 1
//extern const int KernelSize;
//extern const int KernelLen;
//extern const int Width;
//extern const int Height;
//extern const int Stride;	//keep Stride = Width at the moment

const int KernelSize = 9;
const int KernelLen = 3;
const int Width = 1024, Height = 1024;
const int Stride = Width;	//keep Stride = Width at the moment
int conv3x3_open(const char*uri, remote_handle64* handle) {
   void *tptr = NULL;
  /* can be any value or ignored, rpc layer doesn't care
   * also ok
   * *handle = 0;
   * *handle = 0xdeadc0de;
   */
   tptr = (void *)malloc(1);
   *handle = (remote_handle64)tptr;
   assert(*handle);
   return 0;
}

/**
 * @param handle, the value returned by open
 * @retval, 0 for success, should always succeed
 */
int conv3x3_close(remote_handle64 handle) {
   if (handle)
      free((void*)handle);
   return 0;
}

int conv3x3_sum(remote_handle64 h, const uint8* src, int srcLen, 
				uint8* dst, int dstLen,
				const uint8* kernel, int kernelLen)
{

  FARF(RUNTIME_HIGH, "===============     DSP1: sum result  ===============");
  return 0;
}

int conv3x3_intrinsicimp(remote_handle64 h, const uint8* src, int srcLen, 
				uint8* dst, int dstLen,
				const uint8* kernel, int kernelLen, int32 per_row, uint32 iterations)
{
    uint64_t start_time = HAP_perf_get_time_us();
    for (int i = 0; i < iterations; ++i) {
		//FARF(ALWAYS, "intrinsics imp\n");
		const uint8 *src0 = src+Stride;
		uint8 *dst0 = dst;
		const unsigned char *L2FETCH_ADDR =  src + (per_row+AHEAD) * Stride;
		long long L2FETCH_PARA = CreateL2pfParam(Stride, Width, per_row, 1);
    	for (int i = 0; i < Height; i+=per_row)
    	{
        	// fetch next row
        	if (i + (per_row+AHEAD) < Height)
        	{
        	    L2fetch((unsigned int)(L2FETCH_ADDR), L2FETCH_PARA);
        	}
			if(per_row ==1)
        		conv3x3Per1Row(src0, Stride, Width, kernel, 0, dst0, Stride);
        	else if(per_row==2)
				conv3x3Per2Row(src0, Stride, Width, kernel, 0, dst0, Stride);
        	else
				conv3x3Per4Row(src0, Stride, Width, kernel, 0, dst0, Stride);
        	src0 += per_row * Stride;
        	dst0 += per_row * Stride;
        	L2FETCH_ADDR += per_row * Stride;
    	}
    }
    uint64_t end_time = HAP_perf_get_time_us();
    FARF(ALWAYS, "time cost %llu us",(uint64_t)(end_time - start_time)/iterations);
	return 0;
}

int conv3x3_halideimp(remote_handle64 _h, const uint8* src, int srcLen, uint8* dst,
				int dstLen, const uint8* kernel, int kernelLen, uint32 iterations)
{
	FARF(ALWAYS, "halide imp\n");
    int error = 0;

    halide_buffer_t input1_buf = {0}, output_buf = {0};
    halide_buffer_t mask_buf = {0};
    halide_dimension_t in_dim[2] = {{0, 0, 0}, {0, 0, 0}};
    halide_dimension_t out_dim[2] = {{0, 0, 0}, {0, 0, 0}};
    halide_dimension_t mask_dim[2] = {{0, 0, 0}, {0, 0, 0}};

    input1_buf.type.code = halide_type_uint;
    input1_buf.type.bits = 8;
    input1_buf.type.lanes = 1;
    input1_buf.dimensions = 2;

    output_buf = input1_buf;
    mask_buf = input1_buf;
    mask_buf.type.code = halide_type_uint;

    input1_buf.host = (uint8_t *)src;
    output_buf.host = (uint8_t *)dst;
    mask_buf.host = (uint8_t *)kernel;

    input1_buf.dim = in_dim;
    output_buf.dim = out_dim;
    mask_buf.dim = mask_dim;

    input1_buf.dim[0].stride = 1;
    input1_buf.dim[0].extent = Width;
    input1_buf.dim[1].stride = Width;
    input1_buf.dim[1].extent = Height;

    output_buf.dim[0].stride = 1;
    output_buf.dim[0].extent = Width;
    output_buf.dim[1].stride = Width;
    output_buf.dim[1].extent = Height;

    mask_buf.dim[0].stride = 1;
    mask_buf.dim[0].extent = 3;
    mask_buf.dim[1].stride = 3;
    mask_buf.dim[1].extent = 3;

    uint64_t start_time = HAP_perf_get_time_us();
    for (int i = 0; i < iterations; ++i) {
    	error = conv3x3_halide(&input1_buf, &mask_buf, &output_buf);
    }
    uint64_t end_time = HAP_perf_get_time_us();
    FARF(ALWAYS, "time cost %llu us",(uint64_t)(end_time - start_time)/iterations);
    return error;
}
