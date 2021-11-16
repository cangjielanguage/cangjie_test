// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   var v_float32: Float32 = 3.4e40 * 0.0

   // Infinity * 0.0 or 0
   if (!isNaN(Inf16 * 0.0)) {
       return 1
   }

   if (!isNaN(Inf16 * 0.0)) {
       return 1
   }

   if (!isNaN(-Inf16 * 0.0)) {
       return 1
   }

   if (!isNaN(Inf32 * 0.0)) {
       return 1
   }

   if (!isNaN(-Inf32 * 0.0)) {
       return 1
   }

   if (!isNaN(Inf64 * 0.0)) {
       return 1
   }

   if (!isNaN(-Inf64 * 0.0)) {
       return 1
   }

   if (!isNaN(v_float32)) {
       return 1
   }

   return 0

}