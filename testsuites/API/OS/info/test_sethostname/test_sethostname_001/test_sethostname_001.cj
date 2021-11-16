// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: a=`%stdx_run %stdx_run_opt %output %stdx_run_args` && b=`hostname` && if [ "$a" = "0" ] && [ "$b" = "host123" ];then echo "pass";fi | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32

func main(){
    var name: CString = CString("host123")
    var result:Int32 = sethostname(name)
    print(result.toString())
    return 0
}
