#clang++ -std=c++11 -I /local/mnt/workspace/Qualcomm/Hexagon_SDK/4.3.0.0/tools/HALIDE_Tools/2.4/Halide/include  -fno-rtti -DLOG2VLEN=7 -DRUN=1 -stdlib=libc++ ./halide/conv3x3_generator.cpp /local/mnt/workspace/Qualcomm/Hexagon_SDK/4.3.0.0/tools/HALIDE_Tools/2.4/Halide/lib/libHalide.a -g /local/mnt/workspace/Qualcomm/Hexagon_SDK/4.3.0.0/tools/HALIDE_Tools/2.4/Halide/tools/GenGen.cpp -o ./halide/conv3x3_generate -lz -lrt -ldl -lpthread -lm -rdynamic
##HL_DEBUG_AUTOSCHEDULE=1 
#./halide/conv3x3_generate -g conv3x3_halide -f conv3x3_halide -e h,assembly,schedule,static_library -o ./src target=hexagon-32-qurt-hvx_128 auto_schedule=true -p /local/mnt/workspace/Qualcomm/Hexagon_SDK/4.3.0.0/tools/HALIDE_Tools/2.4/Halide/lib/libauto_schedule.so -s Adams2019 
#mv src/conv3x3_halide.schedule.h halide

clang++ -std=c++11 -I /local/mnt/workspace/Qualcomm/Hexagon_SDK/4.3.0.0/tools/HALIDE_Tools/2.4/Halide/include  -fno-rtti -DLOG2VLEN=7 -DRUN=1 -stdlib=libc++ halide/conv3x3_generator.cpp /local/mnt/workspace/Qualcomm/Hexagon_SDK/4.3.0.0/tools/HALIDE_Tools/2.4/Halide/lib/libHalide.a /local/mnt/workspace/Qualcomm/Hexagon_SDK/4.3.0.0/tools/HALIDE_Tools/2.4/Halide/tools/GenGen.cpp -o ./halide/conv3x3_generate -lz -lrt -ldl -lpthread -lm 
##HL_DEBUG_AUTOSCHEDULE=1 
./halide/conv3x3_generate -g conv3x3_halide -f conv3x3_halide -e h,assembly,static_library -o ./src target=hexagon-32-qurt-hvx_128 
#HL_DEBUG_AUTOSCHEDULE=1 
mv ./src/conv3x3_halide.s ./src/conv3x3_halide.S
