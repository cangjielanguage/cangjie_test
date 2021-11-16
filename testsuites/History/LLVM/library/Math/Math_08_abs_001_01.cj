// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{

   //No parameter data type is specified(Int8, Int16, Int64)
	if (abs(-1) != 1)  //successful
	{
       return 1
	}
	
	if (abs(-32768) != 32768)  //error
	{
       return 1
	}

   return 0

}
