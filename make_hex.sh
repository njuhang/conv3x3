#!/bin/bash

Build=ReleaseG
Version=v68
Option=hexagon_${Build}_toolv84_${Version}
Name=conv3x3
SdkRoot=$HEXAGON_SDK_ROOT/
Dest=/data/local/tmp/${Name}

make clean V=${Option}
make tree V=${Option}
chmod o-w ${Option}
echo y|python ${SdkRoot}tools/elfsigner/elfsigner.py ADSP_auth -f 0x10074 -i ${Option}/ship/lib${Name}_skel.so -o dsp_sign/8250R
adb push dsp_sign/8250R/lib${Name}_skel.so ${Dest}
