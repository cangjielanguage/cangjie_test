// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args
import math.*

func main(): Int64{

   sqrt(8.0)

   if (sqrt(8.0).toString() != "2.828427")
	{
		return 1
   }
   
   
   return 0

}