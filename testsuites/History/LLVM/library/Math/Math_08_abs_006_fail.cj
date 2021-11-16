// EXEC: echo math=%libdir/math/cangjieMath.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex error

import math.*

func main(): Int64{

   //Int8
   var val_int64: Int64 = -9223372036854775808

   //Calculate the value of the abs() exceeds Int64 range, should be reported error, but not
   abs(val_int64)
 
	//print(abs(val_int64).toString()+"\n")


   return 0

}