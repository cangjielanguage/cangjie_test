// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((cosh(6.6) - 367.548274) > 0.000001) {
       return 1
   }

   if ((cosh(6.6) - 367.548274) < 0.0000001) {
       return 1
   }

   if ((cosh(-2.02) - 3.835490) > 0.000001) {
       return 1
   }

   if ((cosh(-2.02) - 3.835490) < 0.0000001) {
       return 1
   }


   if (cosh(0.0) != 1.000000) {
       return 1
   }

   if (cosh(-0.0) != 1.000000) {
       return 1
   }


   if (!isInf(cosh(Inf64))) {
       return 1
   }

   if (!isInf(cosh(-Inf32))) {
       return 1
   }

   if (!isNaN(cosh(NaN32))) {
       return 1
   }

   if (!isNaN(cosh(NaN64))) {
       return 1
   }

   return 0

}