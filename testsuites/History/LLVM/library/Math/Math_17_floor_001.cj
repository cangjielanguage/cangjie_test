// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   if (floor(123456789.8) !=  123456789.000000) {
       return 1
   }

   if (floor(-123456789.8) != -123456790.000000) {
       return 1
   }

   if (floor(-0.123456789) != -1.000000) {
       return 1
   }

   if (floor(0.0) != 0.000000) {
       return 1
   }


   if (!isInf(floor(-Inf64))) {
       return 1
   }

   if (!isInf(floor(Inf32))) {
       return 1
   }

   if (!isNaN(floor(NaN32))) {
       return 1
   }

   if (!isNaN(floor(NaN64))) {
       return 1
   }

   return 0

}