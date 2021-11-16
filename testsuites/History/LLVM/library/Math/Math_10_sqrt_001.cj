// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   if (sqrt(4.0) != 2.000000) {
       return 1
   }

   if (sqrt(256.0) != 16.000000) {
       return 1
   }

   //if (sqrt(2020.830) != 44.953643) {
   //    return 1
   //}

   if (sqrt(-0.0) != 0.000000) {
       return 1
   }

   if (sqrt(0.0) != 0.000000) {
       return 1
   }


   if (!isInf(sqrt(Inf32))) {
       return 1
   }

   if (!isInf(sqrt(Inf64))) {
       return 1
   }

   if (!isInf(sqrt(Inf32))) {
       return 1
   }

   if (!isInf(sqrt(Inf64))) {
       return 1
   }

   if (!isNaN(sqrt(NaN32))) {
       return 1
   }

   if (!isNaN(sqrt(NaN64))) {
       return 1
   }

   return 0

}