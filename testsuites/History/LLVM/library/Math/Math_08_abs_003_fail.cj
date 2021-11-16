// EXEC: echo math=%libdir/math/cangjieMath.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex error

import math.*

func main(): Int64{

   //Int8
   var val_int8: Int8 = -128

   //Calculate the value of the abs() exceeds Int8 range, should be reported error, but not
   abs(val_int8)
 
	//print(abs(val_int8).toString()+"\n")


   return 0

}