#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT uint16_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, uint16_t a, uint16_t b) {
    return a - b;
}

}