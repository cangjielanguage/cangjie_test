// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if (ceil(123456789.8) !=  123456790.000000) {
       return 1
   }

   if (ceil(-123456789.8) != -123456789.000000) {
       return 1
   }

   if (ceil(-0.123456789) != -0.000000) {
       return 1
   }

   if (ceil(0.0) != 0.000000) {
       return 1
   }


   if (!isInf(ceil(-Inf64))) {
       return 1
   }

   if (!isInf(ceil(Inf32))) {
       return 1
   }

   if (!isNaN(ceil(NaN32))) {
       return 1
   }

   if (!isNaN(ceil(NaN64))) {
       return 1
   }

   return 0

}