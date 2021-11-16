// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex cannot assign to value : 'Class-TimeSpan.TicksPerMillisecond' is an initialized 'let' constant

import datetime.*

func main(): Int64{

   TimeSpan.TicksPerMillisecond = 10000

   return 0

}
