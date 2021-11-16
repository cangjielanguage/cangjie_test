// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   //NaN op FloatNum
   //NaN + FloatNum
   if (!isNaN(NaN64 + NaN64)) {
       return 1
   }

   if (!isNaN(NaN64 + 1.1)) {
       return 1
   }

   if (!isNaN(NaN64 + 0.0)) {
       return 1
   }

   if (!isNaN(NaN64 + Inf64)) {
       return 1
   }

   if (!isNaN(NaN64 - Inf64)) {
       return 1
   }



   //NaN - FloatNum
   if (!isNaN(NaN64 - NaN64)) {
       return 1
   }

   if (!isNaN(NaN64 - 1.1)) {
       return 1
   }

   if (!isNaN(NaN64 - 0.0)) {
       return 1
   }


   //NaN * FloatNum
   if (!isNaN(NaN64 * NaN64)) {
       return 1
   }

   if (!isNaN(NaN64 * 1.1)) {
       return 1
   }

   if (!isNaN(NaN64 * 0.0)) {
       return 1
   }

   if (!isNaN(NaN64 * Inf64)) {
       return 1
   }

   if (!isNaN(NaN64 * Inf64)) {
       return 1
   }

   //NaN / FloatNum
   if (!isNaN(NaN64 / NaN64)) {
       return 1
   }

   if (!isNaN(NaN64 / 1.1)) {
       return 1
   }

   if (!isNaN(NaN64 / 0.0)) {
       return 1
   }

   if (!isNaN(NaN64 / Inf64)) {
       return 1
   }

   if (!isNaN(NaN64 / Inf64)) {
       return 1
   }


   //NaN % FloatNum
   if (!isNaN(NaN64 % NaN64)) {
       return 1
   }

   if (!isNaN(NaN64 % 1.1)) {
       return 1
   }

   if (!isNaN(NaN64 % 0.0)) {
       return 1
   }

   if (!isNaN(NaN64 % Inf64)) {
       return 1
   }

   if (!isNaN(NaN64 % Inf64)) {
       return 1
   }


   //infinity op infinity
   if (!isNaN(Inf64 - Inf64)) {
       return 1
   }

   if (!isNaN(Inf64 / Inf64)) {
       return 1
   }

   return 0

}
