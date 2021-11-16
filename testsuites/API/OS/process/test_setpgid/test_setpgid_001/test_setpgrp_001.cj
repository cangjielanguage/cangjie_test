// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: a=`LD_LIBRARY_PATH=$LD_LIBRARY_PATH:%stdx-package && %stdx_run %stdx_run_opt %output %stdx_run_args` && b=`pid=$$ && ps -p $pid -o pgid=` && c=$((b+1)) && test $a = $c && echo $? | compare %f
// ASSERT: scan-not 1

from std import os.*
from ffi import c.*

func main(){
    var result1:Int32 = setpgid(0, 0)
    if (result1 == 0){
        var result2:Int32 = getpgrp()
        print(result2.toString())
    }
    return 0
}
