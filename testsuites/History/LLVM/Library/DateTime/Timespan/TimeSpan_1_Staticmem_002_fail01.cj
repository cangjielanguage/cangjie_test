// EXEC: echo "datetime=%libdir/datetime/cangjieDatetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex illegal left value
// ASSERT: regex-next '=' is not allowed in block, expected expression or declaration here

import datetime.*

func main(): Int64{

   TimeSpan.MinValue().Days() = 1000

   return 0

}
