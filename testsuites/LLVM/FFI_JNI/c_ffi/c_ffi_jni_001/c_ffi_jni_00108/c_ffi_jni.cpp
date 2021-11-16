#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT int32_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, int32_t a, int32_t b) {
    return a - b;
}

}