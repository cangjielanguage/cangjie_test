// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC-PIPE-1: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f

import math.*

func main(): Int64{

   reverse(1.5)  // EXPECTED: regex no matching function declaration for function call 'reverse'

   return 0

}
