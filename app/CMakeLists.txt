cmake_minimum_required(VERSION 3.4.1)

#include_directories(../../../libpano/)

add_definitions(-DWEBRTC_POSIX)

add_library( native-lib
             SHARED
             src/main/cpp/native-lib.cpp  ${SOURCE_FILES} )


find_library(log-lib log )
find_library(gl-lib GLESv2 )
find_library(z-lib z )

target_link_libraries( native-lib
                       ${log-lib} ${gl-lib} ${z-lib} )
