# Copyright (c) 2013 Bilibili
# copyright (c) 2013 Zhang Rui <bbcallen@gmail.com>
#
# This file is part of ijkPlayer.
#
# ijkPlayer is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# ijkPlayer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with ijkPlayer; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

LOCAL_PATH := $(call my-dir)

MY_APP_JNI_ROOT := $(realpath $(LOCAL_PATH))/..

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)

MY_APP_FFMPEG_OUTPUT_PATH := $(MY_APP_JNI_ROOT)/prebuilt/ffmpeg-armv7a
MY_APP_FFMPEG_INCLUDE_PATH := $(MY_APP_FFMPEG_OUTPUT_PATH)/include
endif
ifeq ($(TARGET_ARCH_ABI),armeabi)
MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_JNI_ROOT)/contrib/build/ffmpeg-armv5/output)
MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
endif
ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_JNI_ROOT)/contrib/build/ffmpeg-arm64/output)
MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
endif
ifeq ($(TARGET_ARCH_ABI),x86)
MY_APP_FFMPEG_OUTPUT_PATH := $(MY_APP_JNI_ROOT)/prebuilt/ffmpeg-x86
$(warning 5$(MY_APP_FFMPEG_OUTPUT_PATH))
MY_APP_FFMPEG_INCLUDE_PATH := $(MY_APP_FFMPEG_OUTPUT_PATH)/include
endif
ifeq ($(TARGET_ARCH_ABI),x86_64)
MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_JNI_ROOT)/contrib/build/ffmpeg-x86_64/output)
MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
endif

include $(call all-subdir-makefiles)

# First lib, which will be built statically.
include $(CLEAR_VARS)
LOCAL_MODULE := testijk
# -mfloat-abi=soft is a workaround for FP register corruption on Exynos 4210
# http://www.spinics.net/lists/arm-kernel/msg368417.html
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_CFLAGS += -mfloat-abi=soft
endif

#LOCAL_C_INCLUDES += $(MY_APP_JNI_ROOT)/jni/ijkmedia
#LOCAL_C_INCLUDES += $(MY_APP_FFMPEG_INCLUDE_PATH)
#LOCAL_C_INCLUDES += $(MY_APP_JNI_ROOT)/jni/ijkmedia/ijkyuv/include
#LOCAL_C_INCLUDES += $(MY_APP_JNI_ROOT)/jni/ijkmedia/ijkj4a
#LOCAL_LDLIBS += -lz -llog -landroid -lOpenSLES -lEGL -lGLESv2
#LOCAL_STATIC_LIBRARIES := ijkplayer ijksdl android-ndk-profiler ijksoundtouch avformat swscale swresample avcodec avutil cpufeatures yuv_static ijkj4a

LOCAL_LDLIBS += -lz -llog
LOCAL_SRC_FILES += $(MY_APP_JNI_ROOT)/cpp/source.cpp
LOCAL_SRC_FILES += $(MY_APP_JNI_ROOT)/cpp/s.c

include $(BUILD_SHARED_LIBRARY)
