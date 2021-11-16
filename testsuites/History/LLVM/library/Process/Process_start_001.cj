// EXEC: echo "func main(): Int64 {\n    var a=0\n    while (a<1000000000) {\n        a++\n    }\n    return 0\n}" > myprocess.cj
// EXEC: %compiler myprocess.cj -o myprocess.out
// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex ^[1-9]\d*$
from os import os.*

func main(): Int64 {
    var proc: Process = Process()
    var res = proc.start("myprocess.out")
    print(res.id.toString())
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
