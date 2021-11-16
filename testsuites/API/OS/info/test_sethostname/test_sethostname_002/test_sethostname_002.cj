// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32
func main(){
    var name: CString = CString("007abc")
    var result:Int32 = sethostname(name)
    if (result == 0 || result == -1) {
        print("pass\n")
    }
    return 0
}
