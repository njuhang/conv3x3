#include "conv3x3_test.h"
#include "rpcmem.h"
#include "remote.h"
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "dsp_capabilities_utils.h"     // available under <HEXAGON_SDK_ROOT>/utils/examples
#include "os_defines.h"

static void print_usage()
{
  printf( "Usage:\n"
    "    conv3x3 [-U unsigned_PD] [-r run_locally] \n\n"
    "Options:\n"
    "-u unsigned_PD: Run on signed or unsigned PD.\n"
    "    0: Run on signed PD.\n"
    "    1: Run on unsigned PD.\n"
    "        Default Value: 1\n"
    "-h use_halide: use halide.\n"
    "    0: run without halide.\n"
    "    1: run with halide.\n"
    "        Default Value: 0\n"
    "-r run_locally:\n"
    "    1: Run locally on APPS.\n"
    "    0: Run on DSP.\n"
    "        Default Value: 1\n"
	"-l loops\n"
    );
}

int main(int argc, char* argv[])
{
  int nErr = 0;
  int runLocal = 1;
  int unsignedPDFlag = 1;
  bool isUnsignedPD_Enabled = false;
  bool use_halide = false;
  int option = 0;
  int per_row = 1;
  uint32 loop = 100;

  while ((option = getopt(argc, argv,"u:r:l:h:p:")) != -1) {
    switch (option) {
      case 'u' : unsignedPDFlag = atoi(optarg);
        break;
      case 'h' : use_halide = atoi(optarg);
        break;
      case 'r' : runLocal = atoi(optarg);
        break;
      case 'l' : loop = atoi(optarg);
        break;
      case 'p' : per_row = atoi(optarg);
        break;
      default:
        print_usage();
      return -1;
    }
  }

  if (unsignedPDFlag < 0 || unsignedPDFlag > 1) {
    nErr = AEE_EBADPARM;
    printf("\nERROR 0x%x: Invalid unsigned PD flag %d\n", nErr, unsignedPDFlag);
    print_usage();
    goto bail;
  }
  if(unsignedPDFlag == 1) {
      isUnsignedPD_Enabled = get_unsignedpd_support();
  }

  printf("\nStarting conv3x3 test\n");
  nErr = conv3x3_test(runLocal, isUnsignedPD_Enabled, use_halide, loop, per_row);
  if (nErr) {
    printf("ERROR 0x%x: Calculator test failed\n\n", nErr);
  }

bail:
  if (nErr) {
    printf("ERROR 0x%x: Calculator example failed\n\n", nErr);
  } else {
    printf("Success\n\n");
  }

  return nErr;
}
