// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args| compare %f
// ASSERT: regex ArithmeticException

import math.*

func main(): Int64{

   var v_u64: UInt64 = 18446744073709551615

   reverse(v_u64 + 1)

   return 0

}