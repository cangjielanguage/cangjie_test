// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex true
from os import os.*

func main(): Int64 {
    print(GetEnvironmentVariable("bucunzaibucunzai"))
    var res = RemoveEnvironmentVariable("bucunzaibucunzai")
    print(res.toString())
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace