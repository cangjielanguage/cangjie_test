// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: export TEST_ENVA=test_enva && export TEST_ENVB=test_envb  && export TEST_ENVC=$TEST_ENVA:$TEST_ENVB && %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

func main(){
    var result = getEnv("TEST_ENVC").getOrThrow()

    print(result)

    if (result == "test_enva:test_envb") {
        print("pass")
    }

    return 0
}
