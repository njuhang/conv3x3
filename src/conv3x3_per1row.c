#include "conv3x3_per1row.h"
#if defined(__hexagon__)
#include "hexagon_types.h"
#include "hexagon_protos.h"         // part of Q6 tools, contains intrinsics definitions
#endif
//#include "qprintf_asm.h"
//#include <stdio.h>
#include "HAP_farf.h"
#ifdef __cplusplus
extern "C" {
#endif
#define VLEN 128   // only supported vlen
#define LOG2VLEN 7

void conv3x3Per1Row(
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

    HVX_Vector sLine00, sLine01, sLine10, sLine11, sLine20, sLine21;
    HVX_Vector sX00, sX02, sX10, sX12, sX20, sX22;
    HVX_VectorPair dX02X00, dX12X10, dX22X20, dX02X12, dX12X22;
    HVX_VectorPair dSum0;

    HVX_Vector *pin0 = (HVX_Vector *)(inp  - 1*stride_i);
    HVX_Vector *pin1 = (HVX_Vector *)(inp  + 0*stride_i);
    HVX_Vector *pin2 = (HVX_Vector *)(inp  + 1*stride_i);
    HVX_Vector *pout0= (HVX_Vector *)(outp + 0*stride_o);

    sLine00 = Q6_V_vzero();
    sLine10 = Q6_V_vzero();
    sLine20 = Q6_V_vzero();

    sLine01 = *pin0++;
    sLine11 = *pin1++;
    sLine21 = *pin2++;

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

        sLine00 = sLine01;
        sLine10 = sLine11;
        sLine20 = sLine21;

        sLine01 = *pin0++;
        sLine11 = *pin1++;
        sLine21 = *pin2++;

        sX02 = Q6_V_valign_VVI(sLine01,sLine00,1);
        sX12 = Q6_V_valign_VVI(sLine11,sLine10,1);
        sX22 = Q6_V_valign_VVI(sLine21,sLine20,1);

        dX02X00 = Q6_W_vcombine_VV(sX02,sX00);
        dX12X10 = Q6_W_vcombine_VV(sX12,sX10);
        dSum0 = Q6_Wh_vdmpy_WubRb(dX02X00,m1m0);

        dX22X20 = Q6_W_vcombine_VV(sX22,sX20);
        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX12X10,m4m3);

        dX02X12 = Q6_W_vcombine_VV(sX02,sX12);
        dX12X22 = Q6_W_vcombine_VV(sX12,sX22);
        dSum0 = Q6_Wh_vmpaacc_WhWubRb(dSum0,dX02X12,m2m5);
        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX22X20,m7m6);
        dSum0 = Q6_Wh_vmpyacc_WhVubRb(dSum0,sX22,m8m8);

        *pout0++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum0),Q6_V_lo_W(dSum0),shift);
    }

    {
        sX00 = Q6_V_vlalign_VVI(sLine01,sLine00,1);
        sX10 = Q6_V_vlalign_VVI(sLine11,sLine10,1);
        sX20 = Q6_V_vlalign_VVI(sLine21,sLine20,1);

        sLine00 = sLine01;
        sLine10 = sLine11;
        sLine20 = sLine21;

//      sLine01 = *pin0++;
//      sLine11 = *pin1++;
//      sLine21 = *pin2++;
//      sLine31 = *pin3++;

        sX02 = Q6_V_valign_VVI(sLine01,sLine00,1);
        sX12 = Q6_V_valign_VVI(sLine11,sLine10,1);
        sX22 = Q6_V_valign_VVI(sLine21,sLine20,1);

        dX02X00 = Q6_W_vcombine_VV(sX02,sX00);
        dX12X10 = Q6_W_vcombine_VV(sX12,sX10);
        dSum0 = Q6_Wh_vdmpy_WubRb(dX02X00,m1m0);

        dX22X20 = Q6_W_vcombine_VV(sX22,sX20);
        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX12X10,m4m3);

        dX02X12 = Q6_W_vcombine_VV(sX02,sX12);
        dX12X22 = Q6_W_vcombine_VV(sX12,sX22);
        dSum0 = Q6_Wh_vmpaacc_WhWubRb(dSum0,dX02X12,m2m5);

        dSum0 = Q6_Wh_vdmpyacc_WhWubRb(dSum0,dX22X20,m7m6);

        dSum0 = Q6_Wh_vmpyacc_WhVubRb(dSum0,sX22,m8m8);

        *pout0++ = Q6_Vub_vasr_VhVhR_sat(Q6_V_hi_W(dSum0),Q6_V_lo_W(dSum0),shift);
    }
}

#ifdef __cplusplus
}
#endif
