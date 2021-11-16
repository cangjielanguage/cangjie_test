// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if ((tanh(6.6) - 0.999996) > 0.000001) {
       return 1
   }

   if ((tanh(6.6) - 0.999996) < 0.0000001) {
       return 1
   }

   if ((tanh(-2.02) + 0.965413) < -0.000001) {
       return 1
   }

   if ((tanh(-2.02) + 0.965413) > -0.0000001) {
       return 1
   }


   if (tanh(0.0) != 0.000000) {
       return 1
   }

   if (tanh(-0.0) != -0.000000) {
       return 1
   }


   if (tanh(Inf64) != 1.0) {
       return 1
   }

   if (tanh(-Inf32) != -1.0) {
       return 1
   }

   if (!isNaN(tanh(NaN32))) {
       return 1
   }

   if (!isNaN(tanh(NaN64))) {
       return 1
   }

   return 0

}