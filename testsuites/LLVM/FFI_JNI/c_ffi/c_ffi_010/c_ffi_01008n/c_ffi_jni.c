#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
    int fd;
    fd = open("./c_ffi_jni.txt", O_RDONLY);
    close(fd);
    return 0;
}
