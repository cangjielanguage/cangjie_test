#include <cstdint>
#include <cstdio>
#include <iostream>
#include <jni.h>

extern "C" {

JNIEXPORT void JNICALL Java_GlobalJNI_testfunc(JNIEnv* env, jobject thisObj) {
    printf("Hello World by cangjie\n");
}

}