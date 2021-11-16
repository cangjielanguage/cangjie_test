// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output @ $ % - _ = + [ ] { } : , . / %stdx_run_args | compare %f
// ASSERT: scan test_getArgs_002.out @ $ % - _ = + [ ] { } : , . /

from std import os.*
from ffi import c.*

func main(){
    var result = getArgs()
    for (myresult in result){
        print(myresult + " ")
    }

    return 0
}
