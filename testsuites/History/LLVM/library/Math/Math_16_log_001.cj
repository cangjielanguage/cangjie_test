// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   if ((log(0.1) + 2.302585)  < -0.000001) {
       return 1
   }

   if ((log(2020.0) - 7.610852) > 0.000001) {
       return 1
   }

   if (!isInf(log(Inf32))) {
       return 1
   }

   if (!isInf(log(Inf64))) {
       return 1
   }

   if (!isNaN(log(NaN32))) {
       return 1
   }

   if (!isNaN(log(NaN64))) {
       return 1
   }

   return 0

}