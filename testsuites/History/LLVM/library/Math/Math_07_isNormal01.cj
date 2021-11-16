// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{


   var v_float16 :Float16 = 65503.9
   var v_float32 :Float32 = 123456789.0
   var v_float64 :Float64 = 3.6e38

   //print("${isInf32(3.5e38)}\n")


   if (!isNormal(v_float16)) {
       return 1
   }

   if (!isNormal(v_float32)) {
       return 1
   }

   if (!isNormal(v_float64)) {
       return 1
   }

   if (isNormal(NaN16)) {
       return 1
   }

   if (isNormal(NaN32)) {
       return 1
   }

   if (isNormal(NaN64)) {
       return 1
   }

   if (isNormal(Inf16)) {
       return 1
   }

   if (isNormal(Inf32)) {
       return 1
   }

   if (isNormal(Inf64)) {
       return 1
   }
   return 0

}