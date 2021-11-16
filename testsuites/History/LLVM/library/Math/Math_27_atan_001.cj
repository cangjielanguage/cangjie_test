// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((atan(0.5) - 0.463647) > 0.000001) {
       return 1
   }

   if ((atan(20.20) - 1.521331) > 0.000001) {
       return 1
   }

   if ((atan(-2.02) + 1.111116) < -0.000001) {
       return 1
   }

   if ((atan(0.0) != 0.000000)) {
       return 1
   }


   if ((atan(Inf64) - Pi/2.0) > 0.000001) {
       return 1
   }

   if (!isNaN(atan(NaN32))) {
       return 1
   }

   if (!isNaN(atan(NaN64))) {
       return 1
   }

   return 0

}