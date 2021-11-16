// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'd1'


import datetime.*

func main(): Int64{


var t1:DateTime = DateTime(1996, EMonth.Dec, 6)
var t11:DateTime = DateTime(1996, EMonth.Oct, 12)
var d1:TimeSpan  = t1 + t11

return 0

}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace