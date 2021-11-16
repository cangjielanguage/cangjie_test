// DEPENDENCE: run.sh test.c cstr2int.c
// EXEC-PIPE-0: bash run.sh %stdx_cmp_opt | compare %f
// ASSERT: scan pass1
// ASSERT: scan pass2

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString): Int32

foreign func cstr2int(cstr: CString): Int32

unsafe func readtxt():Int32{
    var buf = CString(" ")
    var fd = `open`(CString("test.txt"), O_RDWR)
    var readNum = read(fd, buf.getChars(), UIntNative(1024))
    close(fd)
    var mypid: Int32 = cstr2int(buf)
    return mypid
}

unsafe func main(){
    var pid: Int32 = readtxt()
    var result1 = kill(pid, SIGTERM)

    if (result1==0){
        print(pid.toString())
    }
    return 0
}
