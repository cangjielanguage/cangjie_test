// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import math.*

func main(): Int64{
   let a = NaN16
   let b = NaN32
   let c = NaN64

   if (a == NaN16) {
      return 1
   }

   if (b == NaN32) {
      return 1
   }

   if (c == NaN64) {
      return 1
   }

   if ((a > 1.0) && (a == 1.0) && (a < 1.0)) {
      return 1
   }

   if ((b > 1.0) && (b == 1.0) && (b < 1.0)) {
      return 1
   }

   if ((c > 1.0) && (c == 1.0) && (c < 1.0)) {
      return 1
   }

   return 0

}