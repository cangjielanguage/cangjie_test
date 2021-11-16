// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{
   let a1 = Inf16(-9223372036854775808)
   let a2 = Inf16(0)
   let a3 = Inf16(9223372036854775807)

   let b1 = Inf32(-9223372036854775808)
   let b2 = Inf32(1)
   let b3 = Inf32(9223372036854775807)

   let c1 = Inf64(-9223372036854775808)
   let c2 = Inf64(-1)
   let c3 = Inf64(9223372036854775807)


   if (a1 != Inf16(-10)) {
       return 1
   }

   if (a2 != Inf16(10)) {
       return 1
   }

   if (a3 != Inf16(10)) {
       return 1
   }

   if (a1 > -9223372036854775808.0) {
       return 1
   }

   if (a3 < 9223372036854775807.0) {
       return 1
   }


   if (b1 != Inf32(-10)) {
       return 1
   }

   if (b2 != Inf32(10)) {
       return 1
   }

   if (b3 != Inf32(10)) {
       return 1
   }

   if (b1 > -9223372036854775808.0) {
       return 1
   }

   if (b3 < 9223372036854775807.0) {
       return 1
   }


   if (c1 != Inf64(-10)) {
       return 1
   }

   if (c2 != Inf64(-10)) {
       return 1
   }

   if (c3 != Inf64(10)) {
       return 1
   }

   if (c1 > -9223372036854775808.0) {
       return 1
   }

   if (c3 < 9223372036854775807.0) {
       return 1
   }

   if (Inf16(10) != -Inf16(-10)) {
       return 1
   }

   if (Inf32(10) != -Inf32(-10)) {
       return 1
   }

   if (Inf32(10) != -Inf32(-10)) {
       return 1
   }

   if ("${5.0/Inf16(5)}" != "0.000000" ) {
       return 1
   }

   if ("${5.0/Inf16(5)}" != "0.000000" ) {
       return 1
   }

   if ("${5.0/-Inf32(5)}" != "-0.000000" ) {
       return 1
   }

   if ("${0.0/Inf64(5)}" != "0.000000" ) {
       return 1
   }

   return 0

}