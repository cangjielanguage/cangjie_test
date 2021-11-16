// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC-PIPE-1: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f

import math.*

func main(): Int64{

   sqrt(-1.8e308)  // EXPECTED: regex the number '-1.8e308' exceeds the value range of type 'Float'

   return 0

}

