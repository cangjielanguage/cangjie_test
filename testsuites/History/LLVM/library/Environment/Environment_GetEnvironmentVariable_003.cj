// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex 华为。。“”..\\n
from os import os.*

func main(): Int64 {
    SetEnvironmentVariable("TESHU", "华为。。“”..\\n")
    var envVar = GetEnvironmentVariable("TESHU")
    print(envVar)
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace