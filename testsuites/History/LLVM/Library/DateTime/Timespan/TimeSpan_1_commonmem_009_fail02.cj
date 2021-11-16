// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(10,24,10)

   TimeSpan(10,24,10).Equals(TimeSpan(00,10,24,10,000)).Equals(TimeSpan(374500000000))


   return 0

}
