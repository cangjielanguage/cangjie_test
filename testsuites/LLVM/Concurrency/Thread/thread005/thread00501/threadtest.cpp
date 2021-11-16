#include <cstdint>
#include <cstdio>
#include <sys/types.h>
#include <unistd.h>
#include <sys/syscall.h>

extern "C" {

int64_t testfunc() {
    pid_t tid = syscall(__NR_gettid);
    printf("tid=%d\n", tid);
    return tid;
}

}
