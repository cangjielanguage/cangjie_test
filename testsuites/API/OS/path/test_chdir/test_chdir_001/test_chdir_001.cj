// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32

func main(){
    var newpath: CString = CString("/")
    var result: Int32 = chdir(newpath)

    var pwd: CString = getcwd()

    if ((result == 0) && (pwd.equals(newpath))) {
        print("pass")
    }

    return 0
}
