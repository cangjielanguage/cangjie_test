// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: chmod 666 %output && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:%stdx-package && %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: scan Permission denied

from std import os.*
from ffi import c.*

func main(){
    var result:Int32 = setuid(1)
    return 0
}
