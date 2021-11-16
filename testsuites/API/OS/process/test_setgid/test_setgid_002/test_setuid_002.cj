// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:%stdx-package && %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

func main(){
    var result:Int32 = setgid(0)
    if (result == 0){
       print("pass\n")
    }
    return 0
}
