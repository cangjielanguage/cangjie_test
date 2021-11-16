#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT float JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, float a, float b) {
    return a * b;
}

}