// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   if (log10(100.0) != 2.000000) {
       return 1
   }

   if (log10(0.1) != -1.000000) {
       return 1
   }

   if ((log10(2020.0) - 3.305351) > 0.000001) {
       return 1
   }


   if (!isInf(log10(Inf32))) {
       return 1
   }

   if (!isInf(log10(Inf64))) {
       return 1
   }

   if (!isNaN(log10(NaN32))) {
       return 1
   }

   if (!isNaN(log10(NaN64))) {
       return 1
   }

   return 0

}