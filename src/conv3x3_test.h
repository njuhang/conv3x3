#ifndef CALCULATOR_TEST_H
#define CALCULATOR_TEST_H
/*==============================================================================
  Copyright (c) 2012-2014, 2020 Qualcomm Technologies, Inc.
  All rights reserved. Qualcomm Proprietary and Confidential.
==============================================================================*/

#include "AEEStdDef.h"
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

int conv3x3_test(int runMode,bool isUnsignedPD_Enabled, bool use_halide, uint32 loop, int per_row);

#ifdef __cplusplus
}
#endif

#endif // CALCULATOR_TEST_H

