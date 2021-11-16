// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

func main(){
    var result1:Int32 = setpgrp()
    if (result1==0){
        var result2:Int32 = getpgrp()
        if (result2 != -1){
            print("pass\n")
        }
    }
    return 0
}
