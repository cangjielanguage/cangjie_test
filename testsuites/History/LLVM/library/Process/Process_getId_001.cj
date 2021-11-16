// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args
from os import os.*

func main(): Int64 {
    var proc: Process = Process.getProcessById(ProcessId(1))
    var res = proc.getID()
    if (res.id==1){
        return 0
    }
    return 1
}

