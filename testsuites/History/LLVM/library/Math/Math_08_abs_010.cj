// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{

	var val: Float64 = -02e3
   
	if (abs(val).toString() != "2000.000000")
	{
		return 1
	}


   return 0

}