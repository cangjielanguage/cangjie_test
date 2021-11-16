// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: regex IllegalArgumentException: Argument out of range exception

import datetime.*

func main(): Int64{
    
   var ts_hour_0 = TimeSpan(-9223372036854775808,0,0)
   let ts_hour_1 = TimeSpan(9223372036854775807,0,0)



   return 0

}
