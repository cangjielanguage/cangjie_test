// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: export TEST_ENV=test_env && %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*
from std import collection.*

func main(){
    var path = envVars()
    var res = path.get("TEST_ENV").getOrThrow()

    if (res == "test_env"){
        print("pass")
    }

    return 0
}
