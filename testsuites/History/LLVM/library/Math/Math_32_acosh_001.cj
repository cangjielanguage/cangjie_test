// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((acosh(6.6) - 2.574427) > 0.000001) {
       return 1
   }

   if ((acosh(6.6) - 2.574427) < 0.0000001) {
       return 1
   }

   if (acosh(1.0) != 0.000000) {
       return 1
   }


   if (!isInf(acosh(Inf64))) {
       return 1
   }

   if (!isNaN(acosh(NaN32))) {
       return 1
   }

   if (!isNaN(acosh(NaN64))) {
       return 1
   }

   return 0

}