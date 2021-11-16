// EXEC: echo "datetime=%libdir/datetime/cangjieDatetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex illegal left value

import datetime.*

func main(): Int64{
    DateTime.MaxValue() = 5

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace