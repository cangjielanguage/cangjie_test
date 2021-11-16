// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if (exp(-0.0) != 1.000000) {
       return 1
   }

   if (exp(0.0) != 1.000000) {
       return 1
   }

   if (!isInf(exp(10000.0))) {
       return 1
   }

   if (!isInf(exp(Inf32))) {
       return 1
   }

   if (!isInf(exp(Inf64))) {
       return 1
   }

   if (exp(-Inf32) != 0.000000) {
       return 1
   }

   if (exp(-Inf64) != 0.000000) {
       return 1
   }

   if (!isNaN(exp(NaN32))) {
       return 1
   }

   if (!isNaN(exp(NaN64))) {
       return 1
   }

   return 0

}