// EXEC: echo math=%libdir/math/cangjieMath.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f 2>&1 | compare %f
// ASSERT: regex error

import math.*

func main(): Int64{

   //Int16
   var val_int16: Int16 = -32768

   //Calculate the value of the abs() exceeds Int16 range, should be reported error, but not
   abs(val_int16)
 
	//print(abs(val_int16).toString()+"\n")


   return 0

}