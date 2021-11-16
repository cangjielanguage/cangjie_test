// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex MALE
from os import os.*

func main(): Int64 {
    SetEnvironmentVariable("SEX", "MALE")
    var envVar = GetEnvironmentVariable("SEX")
    print(envVar)
    return 0
}



// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace