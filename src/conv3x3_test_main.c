/*==============================================================================
  Copyright (c) 2012-2013, 2020 Qualcomm Technologies, Inc.
  All rights reserved. Qualcomm Proprietary and Confidential.
==============================================================================*/

#include <stdio.h>
#include "verify.h"

#include "conv3x3.h"
#include "conv3x3_test.h"

#ifndef CALC_EXPORT
#define CALC_EXPORT
#endif /*CALC_EXPORT*/


CALC_EXPORT int main(void)
{
   int nErr  =  0;
   int nPass =  0;

   /* For Simulator DSP domain does not matter so any dummy value should work.
    * Here ADSP_DOMAIN_ID is being used. */
   VERIFY(0 == (nErr = conv3x3_test(0, 0, 0, 1)));
   nPass++;

bail:
   printf("############################################################\n");
   printf("Summary Report \n");
   printf("############################################################\n");
   printf("Pass: %d\n", nPass);
   printf("Fail: %d\n", 1 - nPass);

   return nErr;
}
