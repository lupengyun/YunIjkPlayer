#include <jni.h>
#include <android/log.h>
#include <string>
#include "cy_video_render.h"

JavaVM* g_vm = NULL;

class ExternalRender : public ICyVideoRender {
public:
    virtual void loadI420Frame(
      int width, int height,
      const unsigned char* data_y, int stride_y,
      const unsigned char* data_u, int stride_u,
      const unsigned char* data_v, int stride_v) {
        __android_log_print(ANDROID_LOG_DEBUG, "x4x", "h %d, sy %d", height, stride_y);
    }
};

ExternalRender ger;


jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv* env;
    if (vm->GetEnv(reinterpret_cast<void**>(&env), JNI_VERSION_1_6) != JNI_OK) {
        return -1;
    }

    // Get jclass with env->FindClass.
    // Register methods with env->RegisterNatives.

    g_vm = vm;

    return JNI_VERSION_1_6;
}

void JNICALL JNI_OnUnload(JavaVM* vm, void* reserved) {

}

std::string jstringToStdString(JNIEnv *env, jstring src) {
    const char *nativeString = env->GetStringUTFChars(src, 0);
    std::string cppstr = nativeString;
    env->ReleaseStringUTFChars(src, nativeString);
    return cppstr;
}

extern "C" void Java_com_cylan_test_GLESActivityDF_startVideo(
    JNIEnv* env, jobject jthis, jstring url) {
    std::string curl = jstringToStdString(env, url);

}

extern "C" jlong Java_com_example_ldh_testijkplayer_MainActivity_getNativeHandler(
        JNIEnv* env, jobject jthis) {
    return (long)&ger;
}




