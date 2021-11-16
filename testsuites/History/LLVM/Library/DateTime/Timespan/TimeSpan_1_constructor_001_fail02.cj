// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex exceeds the value range of type 'Int64'

import datetime.*

func main(): Int64{
   var ts0 = TimeSpan(-92233720368547758080)

   //print(ts0.toString() + "\n")

   return 0

}