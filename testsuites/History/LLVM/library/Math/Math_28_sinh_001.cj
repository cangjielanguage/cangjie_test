// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((sinh(6.6) - 367.546914) > 0.000001) {
       return 1
   }

   if ((sinh(6.6) - 367.546914) < 0.0000001) {
       return 1
   }

   if ((sinh(-2.02) + 3.702834) < -0.000001) {
       return 1
   }

   if ((sinh(-2.02) + 3.702834) > -0.0000001) {
       return 1
   }


   if (sinh(0.0) != 0.000000) {
       return 1
   }

   if (sinh(-0.0) != -0.000000) {
       return 1
   }


   if (!isInf(sinh(Inf64))) {
       return 1
   }

   if (!isInf(sinh(-Inf32))) {
       return 1
   }

   if (!isNaN(sinh(NaN32))) {
       return 1
   }

   if (!isNaN(sinh(NaN64))) {
       return 1
   }

   return 0

}