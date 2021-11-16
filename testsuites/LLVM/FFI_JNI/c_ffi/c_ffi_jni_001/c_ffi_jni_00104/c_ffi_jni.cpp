#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT int8_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, int8_t a) {
    return -a;
}

}