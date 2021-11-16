// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

import math.*

func main(): Int64{
   let a = Inf16(Inf16(10))

   return 0

}