// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   if (isNaN(NaN16 + 1.1).toString() != "true") {
       return 1
   }

   if (isNaN(NaN32 + 1.1).toString() != "true") {
       return 1
   }

   if (isNaN(NaN64 + 1.1).toString() != "true") {
       return 1
   }

   if (isNaN(NaN16 * 1.1).toString() != "true") {
       return 1
   }

   if (isNaN(NaN32 * 1.1).toString() != "true") {
       return 1
   }

   if (isNaN(NaN64 * 1.1).toString() != "true") {
       return 1
   }

   if (isNaN(-NaN16).toString() != "true") {
       return 1
   }

   if (isNaN(-NaN32).toString() != "true") {
       return 1
   }

   if (isNaN(-NaN64).toString() != "true") {
       return 1
   }

   if (isNaN(NaN16).toString() != "true") {
       return 1
   }

   if (isNaN(NaN32).toString() != "true") {
       return 1
   }

   if (isNaN(NaN64).toString() != "true") {
       return 1
   }


   return 0

}