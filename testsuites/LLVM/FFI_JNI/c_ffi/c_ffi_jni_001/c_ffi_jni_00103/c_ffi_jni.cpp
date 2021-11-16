#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT uint32_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, uint32_t a) {
    return a + 1;
}

}