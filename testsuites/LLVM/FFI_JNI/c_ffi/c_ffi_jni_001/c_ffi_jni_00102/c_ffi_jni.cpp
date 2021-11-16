#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT bool JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj, bool a, bool b) {
    return a && b;
}

}