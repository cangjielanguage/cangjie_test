// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
import math.*

func main(): Int64{

   if (trunc(123456789.8) !=  123456789.000000) {
       return 1
   }

   if (trunc(-123456789.8) != -123456789.000000) {
       return 1
   }

   if (trunc(-0.123456789) != -0.000000) {
       return 1
   }

   if (trunc(0.0) != 0.000000) {
       return 1
   }


   if (!isInf(trunc(-Inf64))) {
       return 1
   }

   if (!isInf(trunc(Inf32))) {
       return 1
   }

   if (!isNaN(trunc(NaN32))) {
       return 1
   }

   if (!isNaN(trunc(NaN64))) {
       return 1
   }

   return 0

}