// EXEC: echo math=%libdir/math/cangjieMath.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex error

import math.*

func main(): Int64{

   //Int8
   var val_int32: Int32 = -2147483648

   //Calculate the value of the abs() exceeds Int32 range, should be reported error, but not
   abs(val_int32)
 
	//print(abs(val_int32).toString()+"\n")


   return 0

}