// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{


   if (Pi - 3.141593 > 0.000001) {
       return 1
   }

   if (2.0*Pi - 6.283185 > 0.000001) {
       return 1
   }

   if (Pi/2.0 - 1.570796 > 0.000001) {
       return 1
   }

   if (E - 2.718282 > 0.000001) {
       return 1
   }


   return 0

}