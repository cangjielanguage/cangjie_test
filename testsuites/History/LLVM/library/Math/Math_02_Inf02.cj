// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC-PIPE-1: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f

import math.*

func main(): Int64 {
   let a = Inf16(10)
   let b = Inf32(10)

   if (a == b) {  // EXPECTED: regex invalid binary operator '=='
       return 1
   }
   return 0
}
