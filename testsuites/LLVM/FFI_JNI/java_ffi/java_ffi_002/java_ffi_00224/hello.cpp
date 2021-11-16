#include <cstdio>
#include <jni.h>

extern "C" JNIEXPORT void Java_test_InteropTest_sayHello(JNIEnv* env, jobject thisObj) { printf("Hello World by cangjie\n"); }
