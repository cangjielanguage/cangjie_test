// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args
from os import os.*

func main(): Int64 {
    var res = SetEnvironmentVariable("SEX", "MALEEE")
    print(res.toString())
    print(GetEnvironmentVariable("SEX"))
    return 0
}