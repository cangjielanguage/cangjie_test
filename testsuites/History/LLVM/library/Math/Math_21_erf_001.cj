// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((erf(2.0) - 0.995322) > 0.000001) {
       return 1
   }

   if (erf(20.0) != 1.000000) {
       return 1
   }


   if (erf(Inf64) != 1.000000) {
       return 1
   }

   if (erf(-Inf32) != -1.000000) {
       return 1
   }

   if (!isNaN(erf(NaN32))) {
       return 1
   }

   if (!isNaN(erf(NaN64))) {
       return 1
   }

   return 0

}