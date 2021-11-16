// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Exception

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32

unsafe func main(){
    var path: CString = CString("/dev/abc")

    var fd = `open`(path, O_RDONLY)

    var ttyname: CString = ttyname(fd)

    close(fd)

    return 0
}
