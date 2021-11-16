// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((tan(-18.2) - 0.759503) > 0.000001) {
       return 1
   }

   if ((tan(2.2) + 1.373823) < -0.000001) {
       return 1
   }


   if (tan(0.0) != 0.000000) {
       return 1
   }


   if (!isNaN(tan(Inf64))) {
       return 1
   }

   if (!isNaN(tan(-Inf32))) {
       return 1
   }

   if (!isNaN(tan(NaN32))) {
       return 1
   }

   if (!isNaN(tan(NaN64))) {
       return 1
   }

   return 0

}