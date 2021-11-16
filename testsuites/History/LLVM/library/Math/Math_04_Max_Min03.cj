// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{


   if ((MinFloat16 - 0.000061) > 0.000001) {
       return 1
   }


   var p1_f32: Float32 = 10.0
   var p2_f32: Float32 = -38.0
   var p3_f32: Float32 = -39.0
   var v_float32: Float32 = 1.18 * pow(p1_f32, p2_f32)
   var measure_float32: Float32 = pow(p1_f32, p3_f32)

   if ((MinFloat32 - v_float32) > measure_float32) {
       return 1
   }


   if ((MinFloat64 - 2.23*pow(10.0,-308.0)) > pow(10.0,-309.0)) {
       return 1
   }


   return 0

}