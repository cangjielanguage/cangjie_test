// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

func main(){
    setEnv("TEST_ENV","A+B+1+!")
    var result = getEnv("TEST_ENV").getOrThrow()

    if (result == "A+B+1+!"){
        print("pass")
    }

    return 0
}
