// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IllegalArgumentException

from std import math.*
func main() {
    var m:UInt64=9223372036854775809
    try{
        lcm(m,UInt64(2))
        ()
    }catch(e:IllegalArgumentException)
    {
       print("IllegalArgumentException\n")
    }
   return 0
}
