// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: regex IllegalArgumentException: Argument out of range exception

import datetime.*

func main(): Int64{
   let ts0 = TimeSpan(0,0,0,922337203686)

   return 0

}
