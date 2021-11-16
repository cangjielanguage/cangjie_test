// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   //print(cbrt(2020.830).toString() + "\n")


   if (cbrt(-8.0) != -2.000000) {
       return 1
   }

   if (cbrt(8.0) != 2.000000) {
       return 1
   }

   //if (cbrt(2020.830) != 12.642800) {
   //    return 1
   //}

   if (cbrt(-0.0) != 0.000000) {
       return 1
   }

   if (cbrt(0.0) != 0.000000) {
       return 1
   }

   if (!isInf(cbrt(Inf32))) {
       return 1
   }

   if (!isInf(cbrt(Inf64))) {
       return 1
   }

   if (!isInf(cbrt(Inf32))) {
       return 1
   }

   if (!isInf(cbrt(Inf64))) {
       return 1
   }

   if (!isNaN(cbrt(NaN32))) {
       return 1
   }

   if (!isNaN(cbrt(NaN64))) {
       return 1
   }

   return 0

}