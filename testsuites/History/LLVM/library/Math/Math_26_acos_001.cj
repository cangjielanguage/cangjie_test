// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{


   if ((acos(0.5) - 1.047198) > 0.000001) {
       return 1
   }

   if ((acos(0.0) - 1.570796) > 0.000001) {
       return 1
   }
   if (!isNaN(acos(NaN32))) {
       return 1
   }

   if (!isNaN(acos(NaN64))) {
       return 1
   }

   return 0

}