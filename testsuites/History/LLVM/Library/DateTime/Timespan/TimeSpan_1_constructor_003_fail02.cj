// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'ts0'

import datetime.*

func main(): Int64{
   var ts0 = TimeSpan(23.9,0,0)


   return 0

}
