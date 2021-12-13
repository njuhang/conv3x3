/**=============================================================================
Copyright (c) 2014-2015 QUALCOMM Technologies Incorporated.
All Rights Reserved Qualcomm Proprietary
=============================================================================**/
#ifndef CONV3X3A16_1ROW_H
#define CONV3X3A16_1ROW_H

#ifdef __cplusplus
extern "C"
{
#endif

void conv3x3Per1Row(
    const unsigned char *inp,
    int            stride_i,
    int            width,
    const unsigned char   *mask,
    int            shift,
    unsigned char *outp,
    int            stride_o
    );


#ifdef __cplusplus
}
#endif

#endif    // CONV3X3A16_ASM_H
