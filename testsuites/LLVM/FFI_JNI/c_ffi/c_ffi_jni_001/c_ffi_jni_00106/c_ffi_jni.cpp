#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT int16_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, int16_t a, int16_t b) {
    return a - b;
}

}