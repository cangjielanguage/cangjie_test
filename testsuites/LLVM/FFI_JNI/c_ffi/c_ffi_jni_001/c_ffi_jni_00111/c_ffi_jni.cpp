#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT uint64_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, uint64_t a, uint64_t b) {
    return a - b;
}

}