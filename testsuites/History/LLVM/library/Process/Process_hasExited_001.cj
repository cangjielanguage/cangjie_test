// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex truefalse
from os import os.*

func main(): Int64 {
    var proc: Process = Process()
    proc.start("myprocess.o")
    var proc2: Process = Process.getProcessById(ProcessId(1))
    var res = proc.hasExited()
    var res2 = proc2.hasExited()
    print(res.toString()+res2.toString())
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace