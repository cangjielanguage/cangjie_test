// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

import math.*

func main(): Int64{

   var a: Int32 = 8
   var b: Float32 = 2.0

   pow(a, b)

   return 0

}