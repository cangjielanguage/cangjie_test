#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT int64_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, int64_t a, int64_t b) {
    return a - b;
}

}