// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
import math.*

func main(): Int64{

   if ((asinh(6.6) - 2.585907) > 0.000001) {
       return 1
   }

   if ((asinh(6.6) - 2.585907) < 0.0000001) {
       return 1
   }

   if ((asinh(-2.02) + 1.452544) < -0.000001) {
       return 1
   }

   if ((asinh(-2.02) + 1.452544) > -0.0000001) {
       return 1
   }


   if (asinh(0.0) != 0.000000) {
       return 1
   }

   if (asinh(-0.0) != -0.000000) {
       return 1
   }


   if (!isInf(asinh(Inf64))) {
       return 1
   }

   if (!isInf(asinh(-Inf32))) {
       return 1
   }

   if (!isNaN(asinh(NaN32))) {
       return 1
   }

   if (!isNaN(asinh(NaN64))) {
       return 1
   }

   return 0

}