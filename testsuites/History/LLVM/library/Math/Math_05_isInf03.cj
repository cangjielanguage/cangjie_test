// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   // num/0  return Inf16/32/64
   var v_f16: Float16 = 1.1
   var v_f32: Float32 = 655378.6
   var v_f64: Float64 = 655378.6


   if (!isInf(v_f16/0.0)) {
       return 1
   }

   if (!isInf(-v_f16/0.0)) {
       return 1
   }

   if (!isInf(-v_f32/0.0)) {
       return 1
   }

   if (!isInf(v_f32/0.0)) {
       return 1
   }

   if (!isInf(v_f64/0.0)) {
       return 1
   }

   if (!isInf(-v_f64/0.0)) {
       return 1
   }


   // 0.0/0  return NaN16/32/64
   var v_0_f16: Float16 = 0.0
   var v_0_f32: Float32 = 0.0
   var v_0_f64: Float64 = 0.0

   if (!isNaN(v_0_f16/0.0)) {
       return 1
   }

   if (!isNaN(-v_0_f16/0.0)) {
       return 1
   }

   if (!isNaN(v_0_f32/0.0)) {
       return 1
   }

   if (!isNaN(-v_0_f32/0.0)) {
       return 1
   }

   if (!isNaN(v_0_f64/0.0)) {
       return 1
   }

   if (!isNaN(-v_0_f64/0.0)) {
       return 1
   }


   return 0

}