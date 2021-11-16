// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
import math.*

func main(): Int64{

   if ((atanh(0.5) - 0.549306) > 0.000001) {
       return 1
   }

   if ((atanh(0.5) - 0.549306) < 0.0000001) {
       return 1
   }

   if ((atanh(-0.9) + 1.472219) < -0.000001) {
       return 1
   }

   if ((atanh(-0.9) + 1.472219) > -0.00000001) {
       return 1
   }


   if (atanh(0.0) != 0.000000) {
       return 1
   }

   if (atanh(-0.0) != -0.000000) {
       return 1
   }

   if (!isNaN(atanh(NaN32))) {
       return 1
   }

   if (!isNaN(atanh(NaN64))) {
       return 1
   }

   return 0

}