// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import math.*

func main(): Int64{

   if ((asin(0.5) - 0.523598) > 0.000001) {
       return 1
   }
   if (asin(0.0) != 0.000000) {
       return 1
   }

   if (!isNaN(asin(NaN32))) {
       return 1
   }

   if (!isNaN(asin(NaN64))) {
       return 1
   }

   return 0

}