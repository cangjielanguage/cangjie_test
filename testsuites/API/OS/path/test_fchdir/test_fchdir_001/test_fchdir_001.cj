// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32

unsafe func main(){
    var pwd1: CString = CString("/")

    var fd = `open`(pwd1, O_RDONLY)
    var result: Int32 = fchdir(fd)

    var pwd2: CString = getcwd()

    if ((result == 0) && (pwd2.equals(pwd1))) {
        print("pass")
    }

    close(fd)

    return 0
}
