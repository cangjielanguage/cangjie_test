// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 190
// ASSERT: scan result
// ASSERT: scan-not Exception

from os import os.*
from ffi import c.*
func main():Int64{
    var result = nice(200)
    print("${result}")
    var result1 = kill(0, SIGCHLD)
    print("${result1}\n")
    var result2 = killpg(0, SIGURG)
    print("result ==> ${result2}\n")
    if(isatty(0) && isatty(1) && isatty(2)){
            print("true01 ")
        }else {
            print("false01 ")
        }
        if(isatty(-23) || isatty(4) || isatty(455) || isatty(43332)){
            print("true02 ")
        }else {
            print("false02 ")
        }
        return 0
}
