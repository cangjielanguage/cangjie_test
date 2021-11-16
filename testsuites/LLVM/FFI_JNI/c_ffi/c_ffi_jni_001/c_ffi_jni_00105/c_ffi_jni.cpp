#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT uint8_t JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, uint8_t a) {
    return a + 128;
}

}