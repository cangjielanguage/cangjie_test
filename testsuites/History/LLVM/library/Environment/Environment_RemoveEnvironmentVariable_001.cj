// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex MALEtrue
from os import os.*

func main(): Int64 {
    SetEnvironmentVariable("SEX", "MALE")
    print(GetEnvironmentVariable("SEX"))
    var res = RemoveEnvironmentVariable("SEX")
    print(res.toString())
    print(GetEnvironmentVariable("SEX"))
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace