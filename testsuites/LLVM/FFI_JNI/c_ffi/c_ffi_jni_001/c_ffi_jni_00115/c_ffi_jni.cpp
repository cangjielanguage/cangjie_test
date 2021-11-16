#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT int64_t JNICALL Java_GlobalJNI_testfunc1(JNIEnv* env, jobject thisObj, int64_t a, int64_t b) {
    return a - b;
}

JNIEXPORT int64_t JNICALL Java_GlobalJNI_testfunc2(JNIEnv* env, jobject thisObj, int64_t a, int64_t b) {
    return a + b;
}

}