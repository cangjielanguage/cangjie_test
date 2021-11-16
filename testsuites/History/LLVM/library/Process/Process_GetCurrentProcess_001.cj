// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex Process_GetCurr

from os import os.*

func main(): Int64 {
    var proc: Process = Process.getCurrentProcess()
    var res = proc.getProcessName()
    print(res)
    return 0
}



// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
