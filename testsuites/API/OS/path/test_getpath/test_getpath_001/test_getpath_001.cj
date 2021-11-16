// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: a=`%stdx_run %stdx_run_opt %output %stdx_run_args` && b=`pwd` && if [ "$a" = "$b" ];then echo "pass";fi | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32

func main(){
    var result:CString = getcwd()
    unsafe { printf(result) }
    return 0
}
