// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if (gamma(20.0) != 121645100408832000.000000) {
       return 1
   }

   if (!isInf(gamma(0.0))) {
       return 1
   }

   if (!isInf(gamma(Inf32))) {
       return 1
   }

   if (!isNaN(gamma(-1.0))) {
       return 1
   }

   if (!isNaN(gamma(-Inf64))) {
       return 1
   }

   if (!isNaN(gamma(NaN32))) {
       return 1
   }

   if (!isNaN(gamma(NaN64))) {
       return 1
   }

   return 0

}