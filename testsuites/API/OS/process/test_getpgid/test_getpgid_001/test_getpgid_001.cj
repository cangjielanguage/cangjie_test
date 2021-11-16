// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: a=`%stdx_run %stdx_run_opt %output %stdx_run_args` && b=`pid=$$ && ps -p $pid -o pgid=` && test $a = $b && echo $? | compare %f
// ASSERT: scan-not 1

from std import os.*
from ffi import c.*

func main(){
    var pid: Int32 = getpid()
    var result: Int32 = getpgid(pid)
    print(" " + result.toString())
    return 0
}
