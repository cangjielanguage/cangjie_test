// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'ts0'

import datetime.*

func main(): Int64{
   var ts0 = TimeSpan(9223372036854775807.2)

   return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
