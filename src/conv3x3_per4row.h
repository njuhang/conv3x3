#ifndef CONV3X3A16_4ROW_H
#define CONV3X3A16_4ROW_H

#ifdef __cplusplus
extern "C"
{
#endif

void conv3x3Per4Row(
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
