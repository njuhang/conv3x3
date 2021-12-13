/* ======================================================================== */
/*  QUALCOMM TECHNOLOGIES, INC.                                             */
/*                                                                          */
/*  HEXAGON HVX Image/Video Processing Library                              */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*          Copyright (c) 2014-2015 QUALCOMM TECHNOLOGIES Incorporated.     */
/*                           All Rights Reserved.                           */
/*                  QUALCOMM Confidential and Proprietary                   */
/* ======================================================================== */

/*[========================================================================]*/
/*[ FUNCTION                                                               ]*/
/*[     conv3x3                                                            ]*/
/*[                                                                        ]*/
/*[------------------------------------------------------------------------]*/
/*[ DESCRIPTION                                                            ]*/
/*[     This function applies a 3x3 kernel to filter a image.              ]*/
/*[     During the computation, 16bit accumulator is assumed, therefore    ]*/
/*[     The absolute value of the summation of all coefficients must be    ]*/
/*[     no more than 128.                                                  ]*/
/*[                                                                        ]*/
/*[------------------------------------------------------------------------]*/
/*[ REVISION DATE                                                          ]*/
/*[     AUG-01-2014                                                        ]*/
/*[                                                                        ]*/
/*[========================================================================]*/
#include "conv3x3_per4row.h"
#if defined(__hexagon__)
#include "hexagon_types.h"
#include "hexagon_protos.h"         // part of Q6 tools, contains intrinsics definitions
#endif

#ifdef __cplusplus
extern "C" {
#endif
/* ======================================================================== */
/*  Intrinsic C version of conv3x3().                                       */
/* ======================================================================== */
#define VLEN 128   // only supported vlen
#define LOG2VLEN 7

void conv3x3Per4Row(
    const unsigned char *restrict inp,
    int            stride_i,
    int            width,
    const unsigned char   *restrict mask,
    int            shift,
    unsigned char *restrict outp,
    int            stride_o
    )
{
    int i;
    HEXAGON_Vect32 m1m0, m4m3, m7m6, m2m5, m8m8;

    HVX_Vector sLine00, sLine01, sLine10, sLine11, sLine20, sLine21, sLine30, sLine31, sLine40, sLine41, sLine50, sLine51;
    HVX_Vector sX00, sX02, sX10, sX12, sX20, sX22, sX30, sX32,  sX40, sX42, sX50, sX52;
    HVX_VectorPair dX02X00, dX12X10, dX22X20, dX32X30, dX42X40, dX52X50, dX02X12, dX12X22, dX22X32, dX32X42 ;
    HVX_VectorPair dSum0, dSum1, dSum2, dSum3;

    HVX_Vector *pin0 = (HVX_Vector *)(inp  - 1*stride_i);
    HVX_Vector *pin1 = (HVX_Vector *)(inp  + 0*stride_i);
    HVX_Vector *pin2 = (HVX_Vector *)(inp  + 1*stride_i);
    HVX_Vector *pin3 = (HVX_Vector *)(inp  + 2*stride_i);
    HVX_Vector *pin4 = (HVX_Vector *)(inp  + 3*stride_i);
    HVX_Vector *pin5 = (HVX_Vector *)(inp  + 4*stride_i);

    HVX_Vector *pout0= (HVX_Vector *)(outp + 0*stride_o);
    HVX_Vector *pout1= (HVX_Vector *)(outp + 1*stride_o);
    HVX_Vector *pout2= (HVX_Vector *)(outp + 2*stride_o);
    HVX_Vector *pout3= (HVX_Vector *)(outp + 3*stride_o);

    sLine00 = Q6_V_vzero();
    sLine10 = Q6_V_vzero();
    sLine20 = Q6_V_vzero();
    sLine30 = Q6_V_vzero();
    sLine40 = Q6_V_vzero();
    sLine50 = Q6_V_vzero();

    sLine01 = *pin0++;
    sLine11 = *pin1++;
    sLine21 = *pin2++;
    sLine31 = *pin3++;
    sLine41 = *pin4++;
    sLine51 = *pin5++;

    m1m0 = HEXAGON_V32_CREATE_B(mask[1],mask[0],mask[1],mask[0]);
    m4m3 = HEXAGON_V32_CREATE_B(mask[4],mask[3],mask[4],mask[3]);
    m7m6 = HEXAGON_V32_CREATE_B(mask[7],mask[6],mask[7],mask[6]);
    m2m5 = HEXAGON_V32_CREATE_B(mask[2],mask[5],mask[2],mask[5]);
    m8m8 = HEXAGON_V32_CREATE_B(mask[8],mask[8],mask[8],mask[8]);

    for ( i=width; i>VLEN; i-=VLEN )
    {
        sX00 = Q6_V_vlalign_VVI(sLine01,sLine00,1);
        sX10 = Q6_V_vlalign_VVI(sLine11,sLine10,1);
        sX20 = Q6_V_vlalign_VVI(sLine21,sLine20,1);
        sX30 = Q6_V_vlalign_VVI(sLine31,sLine30,1);
        sX40 = Q6_V_vlalign_VVI(sLine41,sLine40,1);
        sX50 = Q6_V_vlalign_VVI(sLine51,sLine50,1);

        sLine00 = sLine01;
        sLine10 = sLine11;
        sLine20 = sLine21;
        sLine30 = sLine31;
        sLine40 = sLine41;
        sLine50 = sLine51;

        sLine01 = *pin0++;
        sLine11 = *pin1++;
        sLine21 = *pin2++;
        sLine31 = *pin3++;

        sX02 = Q6_V_valign_VVI(sLine01,sLine00,1);
        sX12 = Q6_V_valign_VVI(sLine11,sLine10,1);
        sX22 = Q6_V_valign_VVI(sLine21,sLine20,1);
        sX32 = Q6_V_valign_VVI(sLine31,sLine30,1);
        sX42 = Q6_V_valign_VVI(sLine41,sLine40,1);
        sX52 = Q6_V_valign_VVI(sLine51,sLine50,1);

        dX02X00 = Q6_W_vcombine_VV(sX02,sX00);
        dX12X10 = Q6_W_vcombine_VV(sX12,sX10);
        dX22X20 = Q6_W_vcombine_VV(sX22,sX20);
        dX32X30 = Q6_W_vcombine_VV(sX32,sX30);
        dSum0 = Q6_Wh_vdmpy_WubRb(dX02X00,m1m0);
        dSum1 = Q6_Wh_vdmpy_WubRb(dX12X10,m1m0);
        dSum2 = Q6_Wh_vdmpy_WubRb(dX22X20,m1m0);
        dSum3 = Q6_Wh_vdmpy_WubRb(dX32X30,m1m0);

        dX22X20 = Q6_W_vcombine_VV(sX22,sX20);
        dX32X30 = Q6_W_vcombine_VV(sX32,sX30);
        dX42X40 = Q6_W_vcombine_VV(sX42,sX40);
        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX12X10,m4m3);
        dSum1 = Q6_Wh_vdmpyacc_WhWubRb(dSum1,dX22X20,m4m3);
        dSum2 = Q6_Wh_vdmpyacc_WhWubRb(dSum2,dX32X30,m4m3);
        dSum3 = Q6_Wh_vdmpyacc_WhWubRb(dSum3,dX42X40,m4m3);

        dX02X12 = Q6_W_vcombine_VV(sX02,sX12);
        dX12X22 = Q6_W_vcombine_VV(sX12,sX22);
        dX22X32 = Q6_W_vcombine_VV(sX22,sX32);
        dX32X42 = Q6_W_vcombine_VV(sX32,sX42);
        dSum0 = Q6_Wh_vmpaacc_WhWubRb(dSum0,dX02X12,m2m5);
        dSum1 = Q6_Wh_vmpaacc_WhWubRb(dSum1,dX12X22,m2m5);
        dSum2 = Q6_Wh_vmpaacc_WhWubRb(dSum2,dX22X32,m2m5);
        dSum3 = Q6_Wh_vmpaacc_WhWubRb(dSum3,dX32X42,m2m5);

        dX32X30 = Q6_W_vcombine_VV(sX32,sX30);
        dX42X40 = Q6_W_vcombine_VV(sX42,sX40);
        dX52X50 = Q6_W_vcombine_VV(sX52,sX50);
        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX22X20,m7m6);
        dSum1 = Q6_Wh_vdmpyacc_WhWubRb(dSum1,dX32X30,m7m6);
        dSum2 = Q6_Wh_vdmpyacc_WhWubRb(dSum2,dX42X40,m7m6);
        dSum3 = Q6_Wh_vdmpyacc_WhWubRb(dSum3,dX52X50,m7m6);

        dSum0 = Q6_Wh_vmpyacc_WhVubRb(dSum0,sX22,m8m8);
        dSum1 = Q6_Wh_vmpyacc_WhVubRb(dSum1,sX32,m8m8);
        dSum2 = Q6_Wh_vmpyacc_WhVubRb(dSum2,sX42,m8m8);
        dSum3 = Q6_Wh_vmpyacc_WhVubRb(dSum3,sX52,m8m8);

        *pout0++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum0),Q6_V_lo_W(dSum0),shift);
        *pout1++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum1),Q6_V_lo_W(dSum1),shift);
        *pout2++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum2),Q6_V_lo_W(dSum2),shift);
        *pout3++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum3),Q6_V_lo_W(dSum3),shift);
    }

    {
        sX00 = Q6_V_vlalign_VVI(sLine01,sLine00,1);
        sX10 = Q6_V_vlalign_VVI(sLine11,sLine10,1);
        sX20 = Q6_V_vlalign_VVI(sLine21,sLine20,1);
        sX30 = Q6_V_vlalign_VVI(sLine31,sLine30,1);
        sX40 = Q6_V_vlalign_VVI(sLine41,sLine40,1);
        sX50 = Q6_V_vlalign_VVI(sLine51,sLine50,1);

        sLine00 = sLine01;
        sLine10 = sLine11;
        sLine20 = sLine21;
        sLine30 = sLine31;
        sLine40 = sLine41;
        sLine50 = sLine51;

        sLine01 = *pin0++;
        sLine11 = *pin1++;
        sLine21 = *pin2++;
        sLine31 = *pin3++;

        sX02 = Q6_V_valign_VVI(sLine01,sLine00,1);
        sX12 = Q6_V_valign_VVI(sLine11,sLine10,1);
        sX22 = Q6_V_valign_VVI(sLine21,sLine20,1);
        sX32 = Q6_V_valign_VVI(sLine31,sLine30,1);
        sX42 = Q6_V_valign_VVI(sLine41,sLine40,1);
        sX52 = Q6_V_valign_VVI(sLine51,sLine50,1);

        dX02X00 = Q6_W_vcombine_VV(sX02,sX00);
        dX12X10 = Q6_W_vcombine_VV(sX12,sX10);
        dX22X20 = Q6_W_vcombine_VV(sX22,sX20);
        dX32X30 = Q6_W_vcombine_VV(sX32,sX30);
        dSum0 = Q6_Wh_vdmpy_WubRb(dX02X00,m1m0);
        dSum1 = Q6_Wh_vdmpy_WubRb(dX12X10,m1m0);
        dSum2 = Q6_Wh_vdmpy_WubRb(dX22X20,m1m0);
        dSum3 = Q6_Wh_vdmpy_WubRb(dX32X30,m1m0);

        dX22X20 = Q6_W_vcombine_VV(sX22,sX20);
        dX32X30 = Q6_W_vcombine_VV(sX32,sX30);
        dX42X40 = Q6_W_vcombine_VV(sX42,sX40);
        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX12X10,m4m3);
        dSum1 = Q6_Wh_vdmpyacc_WhWubRb(dSum1,dX22X20,m4m3);
        dSum2 = Q6_Wh_vdmpyacc_WhWubRb(dSum2,dX32X30,m4m3);
        dSum3 = Q6_Wh_vdmpyacc_WhWubRb(dSum3,dX42X40,m4m3);

        dX02X12 = Q6_W_vcombine_VV(sX02,sX12);
        dX12X22 = Q6_W_vcombine_VV(sX12,sX22);
        dX22X32 = Q6_W_vcombine_VV(sX22,sX32);
        dX32X42 = Q6_W_vcombine_VV(sX32,sX42);
        dSum0 = Q6_Wh_vmpaacc_WhWubRb(dSum0,dX02X12,m2m5);
        dSum1 = Q6_Wh_vmpaacc_WhWubRb(dSum1,dX12X22,m2m5);
        dSum2 = Q6_Wh_vmpaacc_WhWubRb(dSum2,dX22X32,m2m5);
        dSum3 = Q6_Wh_vmpaacc_WhWubRb(dSum3,dX32X42,m2m5);

        dX32X30 = Q6_W_vcombine_VV(sX32,sX30);
        dX42X40 = Q6_W_vcombine_VV(sX42,sX40);
        dX52X50 = Q6_W_vcombine_VV(sX52,sX50);
        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX22X20,m7m6);
        dSum1 = Q6_Wh_vdmpyacc_WhWubRb(dSum1,dX32X30,m7m6);
        dSum2 = Q6_Wh_vdmpyacc_WhWubRb(dSum2,dX42X40,m7m6);
        dSum3 = Q6_Wh_vdmpyacc_WhWubRb(dSum3,dX52X50,m7m6);

        dSum0 = Q6_Wh_vmpyacc_WhVubRb(dSum0,sX22,m8m8);
        dSum1 = Q6_Wh_vmpyacc_WhVubRb(dSum1,sX32,m8m8);
        dSum2 = Q6_Wh_vmpyacc_WhVubRb(dSum2,sX42,m8m8);
        dSum3 = Q6_Wh_vmpyacc_WhVubRb(dSum3,sX52,m8m8);

        *pout0++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum0),Q6_V_lo_W(dSum0),shift);
        *pout1++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum1),Q6_V_lo_W(dSum1),shift);
        *pout2++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum2),Q6_V_lo_W(dSum2),shift);
        *pout3++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum3),Q6_V_lo_W(dSum3),shift);
    }
}

#ifdef __cplusplus
}
#endif
