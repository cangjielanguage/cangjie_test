// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex 'add' is not a member of class 'TimeSpan'

import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(21,19,50)
   var ts2: TimeSpan = TimeSpan(2020,8,28)

   var ts12: TimeSpan = ts1.add(ts2)

   return 0

}
