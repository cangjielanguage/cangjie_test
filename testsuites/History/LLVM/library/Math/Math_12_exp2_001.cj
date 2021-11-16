// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   if (exp2(2.0) != 4.000000) {
       return 1
   }

   if (exp2(-2.0) != 0.250000) {
       return 1
   }


   if (exp2(-0.0) != 1.000000) {
       return 1
   }

   if (exp2(0.0) != 1.000000) {
       return 1
   }

   if (!isInf(exp2(10000.0))) {
       return 1
   }

   if (!isInf(exp2(Inf32))) {
       return 1
   }

   if (!isInf(exp2(Inf64))) {
       return 1
   }

   if (exp2(-Inf32) != 0.000000) {
       return 1
   }

   if (exp2(-Inf64) != 0.000000) {
       return 1
   }

   if (!isNaN(exp2(NaN32))) {
       return 1
   }

   if (!isNaN(exp2(NaN64))) {
       return 1
   }

   return 0

}