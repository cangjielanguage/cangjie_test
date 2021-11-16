// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex ambiguous match for function call

import math.*

func main(): Int64{

   //var v_u8_2: UInt8 = 1

   //if (9223372036854775808(v_u8_2) != 9223372036854775808) {
   //    return 1
   //}

   if (reverse(1) != 9223372036854775808) {
       return 1
   }

   return 0

}