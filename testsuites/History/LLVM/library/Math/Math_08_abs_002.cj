// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{



   //Float16
   var val_float16: Float16 = 65504.0
   if (abs(-val_float16) != val_float16) {
       return 1
   }

   if (abs(val_float16) != 65504.0) {
       return 1
   }




   return 0

}