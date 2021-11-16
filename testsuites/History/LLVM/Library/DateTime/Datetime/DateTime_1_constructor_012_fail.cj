// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 't1'

import datetime.*

func main(): Int64{
    var t1 = DateTime(1,0.99999,1)
    
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace