#include "../../cpp/cy_video_render.h"
#include <android/log.h>
#include <stdio.h>

extern "C" {

void CyExternalRenderFunc(void* obj, int width, int height,
      const unsigned char* data_y, int stride_y,
      const unsigned char* data_u, int stride_u,
      const unsigned char* data_v, int stride_v) {
    ICyVideoRender* icvr = (ICyVideoRender*)obj;
    //__android_log_print(ANDROID_LOG_DEBUG, "x4x", "icvr %p", icvr);
    icvr->loadI420Frame(width, height,
                        data_y, stride_y,
                        data_u, stride_u,
                        data_v, stride_v);
}

}
