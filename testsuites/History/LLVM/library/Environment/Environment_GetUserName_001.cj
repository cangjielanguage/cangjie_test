// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex ^[a-zA-Z0-9_-]+$
from os import os.*

func main(): Int64 {
    print(GetUserName())
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
