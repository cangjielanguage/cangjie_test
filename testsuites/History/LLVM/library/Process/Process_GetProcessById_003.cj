// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex File /proc/-666/status does not exist
from os import os.*

func main(): Int64 {
    var proc: Process = Process.getProcessById(ProcessId(-666))
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace