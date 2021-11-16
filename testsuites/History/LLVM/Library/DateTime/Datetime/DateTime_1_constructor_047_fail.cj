// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IllegalArgumentException: arguments overflow

import datetime.*

func main(): Int64{
    var t1 = DateTime(-2110000,EMonth.Oct,10)

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace