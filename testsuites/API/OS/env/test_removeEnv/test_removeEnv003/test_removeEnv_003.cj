// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: export TEST_ENV=test_env && %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

func main(){
    var result1 = getEnv("TEST_ENV").getOrThrow()
    if (result1 != "") {
        removeEnv("TEST_GET_ENV")
        var result2 = getEnv("TEST_ENV").getOrThrow()
        if (result2 == "test_env"){
            print("pass")
        }
    }
    return 0
}
