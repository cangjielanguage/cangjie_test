#include <stdio.h>
#ifndef __linux__
#include "windows.h"
#else
#include "unistd.h"
#include <sys/syscall.h>
#define gettid() syscall(__NR_gettid)
#endif


#ifndef __linux__
int testfunc() {
    return GetCurrentThreadId();
}
#else
int testfunc() {
    return gettid();
}
#endif