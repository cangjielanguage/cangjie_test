// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex exceeds the value range of type 'UInt64'

import math.*

func main(): Int64{

   var v_u64: UInt64 = 184467440737095516150

   leadingZeros(v_u64 + 1)

   print(leadingZeros(v_u64).toString() + "\n")

   return 0

}