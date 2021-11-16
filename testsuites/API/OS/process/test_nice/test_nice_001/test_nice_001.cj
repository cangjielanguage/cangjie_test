// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: a=`LD_LIBRARY_PATH=$LD_LIBRARY_PATH:%stdx-package && %stdx_run %stdx_run_opt %output %stdx_run_args` && b=`nice` &&echo "a:$a\n" && echo "b:$b\n" && test $a = $b && echo $? | compare %f
// ASSERT: scan-not 1

from std import os.*
from ffi import c.*

func main(){
    var result:Int32 = nice(10)
    if (result != -1){
        print(result.toString())
    }
    while(true){
        print("a\n")
    }
    return 0
}
