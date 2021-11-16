#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT double JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, int64_t a, double b) {
    return a / b;
}

}