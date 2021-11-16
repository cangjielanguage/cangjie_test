// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IllegalArgumentException

from std import math.*

func main() {
   try{
       lcm(UInt16(32769),UInt16(2))
       ()
   }catch(e:IllegalArgumentException)
   {
      print("IllegalArgumentException\n")
   }
   return 0
}