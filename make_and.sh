#!/bin/bash

Build=ReleaseG
Option=android_${Build}_aarch64
Name=conv3x3
#SdkRoot=/home/lvhang/hexagon4.3/Hexagon_SDK/4.3.0.0/
SdkRoot=$HEXAGON_SDK_ROOT/
Dest=/data/local/tmp/${Name}

rm ${Option} -r
make android BUILD=${Build}
chmod o-w ${Option}
adb push ${Option}/lib${Name}.so ${Dest}
adb push ${Option}/${Name} ${Dest}
adb push usage.md ${Dest}
