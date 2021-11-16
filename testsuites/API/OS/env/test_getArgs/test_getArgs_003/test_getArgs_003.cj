// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output ~ %stdx_run_args | compare %f
// ASSERT: scan test_getArgs_003.out

from std import os.*
from ffi import c.*

func main(){
    var result = getArgs()
    for (myresult in result){
        print(myresult + " ")
    }

    return 0
}
