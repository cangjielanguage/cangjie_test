// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex ambiguous match for function call 'reverse'

import math.*

func main(): Int64{

   reverse(-1)

   return 0

}