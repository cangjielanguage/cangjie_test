// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from ffi import c.*

func main(){
    var path = getEnv("TEST_ENV")

    var result = match(path) {
        case Some(x) => "fail"
        case $None => ""
    }

    if (result=="") {
        print("pass")
    }

    return 0
}
