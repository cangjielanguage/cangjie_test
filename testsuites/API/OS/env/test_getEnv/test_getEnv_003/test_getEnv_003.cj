// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: export TEST_ENV=test_env && %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

func main(){
    var result = getEnv("TEST_ENV").getOrThrow()

    if (result == "test_env") {
        print("pass")
    }

    return 0
}
