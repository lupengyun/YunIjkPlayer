LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ijkffmpeg
LOCAL_SRC_FILES := $(MY_APP_FFMPEG_OUTPUT_PATH)/libijkffmpeg.so
include $(PREBUILT_SHARED_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE := avcodec
#LOCAL_SRC_FILES :=  $(MY_APP_FFMPEG_OUTPUT_PATH)/lib/libavcodec.a
#include $(PREBUILT_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE := avformat
#LOCAL_SRC_FILES :=  $(MY_APP_FFMPEG_OUTPUT_PATH)/lib/libavformat.a
#include $(PREBUILT_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE := avutil
#LOCAL_SRC_FILES :=  $(MY_APP_FFMPEG_OUTPUT_PATH)/lib/libavutil.a
#include $(PREBUILT_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE := swscale
#LOCAL_SRC_FILES :=  $(MY_APP_FFMPEG_OUTPUT_PATH)/lib/libswscale.a
#include $(PREBUILT_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE := swresample
#LOCAL_SRC_FILES :=  $(MY_APP_FFMPEG_OUTPUT_PATH)/lib/libswresample.a
#include $(PREBUILT_STATIC_LIBRARY)
