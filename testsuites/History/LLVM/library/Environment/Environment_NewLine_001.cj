// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex (test[\n]test)
from os import os.*

func main(): Int64 {
    var res=NewLine()
    print("test"+res+"test")
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace