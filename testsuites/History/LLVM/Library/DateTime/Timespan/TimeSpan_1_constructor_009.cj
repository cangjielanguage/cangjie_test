// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{


   
   
var t_max = TimeSpan(99999999,999999999,99999999999)
var t_min = TimeSpan(-99999999,-999999999,-99999999999)

if (t_max.GetTicks().toString() != "5199999963390000000") //不超过int64
{
	return 1
}

if (t_min.GetTicks().toString() != "-5199999963390000000") //不超过int64
{
	return 1
}

   return 0

}
