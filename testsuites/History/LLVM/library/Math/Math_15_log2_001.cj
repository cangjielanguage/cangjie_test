// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   if (log2(4.0) != 2.000000) {
       return 1
   }

   if ((log2(0.1) + 3.321928)  < -0.000001) {
       return 1
   }

   if ((log2(2020.0) - 10.980139) > 0.000001) {
       return 1
   }


   if (!isInf(log2(Inf32))) {
       return 1
   }

   if (!isInf(log2(Inf64))) {
       return 1
   }

   if (!isNaN(log2(NaN32))) {
       return 1
   }

   if (!isNaN(log2(NaN64))) {
       return 1
   }

   return 0

}