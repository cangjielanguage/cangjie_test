#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT void JNICALL Java_GlobalJNI_testfunc1(JNIEnv* env, jobject thisObj) {
    printf("Hello World by cangjie testfunc1\n");
}

JNIEXPORT void JNICALL Java_GlobalJNI_testfunc2(JNIEnv* env, jobject thisObj) {
    printf("Hello World by cangjie testfunc2\n");
}

}