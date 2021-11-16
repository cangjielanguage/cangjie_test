// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: regex IllegalArgumentException

import math.*

func main(): Int64{

   atanh(8.0)

   return 0

}