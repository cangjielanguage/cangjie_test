// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex Linux*
from os import os.*

func main(): Int64 {
    print(GetOSVersion())
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace