// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((cos(-18.2) - 0.796352) > 0.000001) {
       return 1
   }

   if ((cos(2.2) + 0.588501) < -0.000001) {
       return 1
   }


   if (cos(0.0) != 1.000000) {
       return 1
   }


   if (!isNaN(cos(Inf64))) {
       return 1
   }

   if (!isNaN(cos(-Inf32))) {
       return 1
   }

   if (!isNaN(cos(NaN32))) {
       return 1
   }

   if (!isNaN(cos(NaN64))) {
       return 1
   }

   return 0

}