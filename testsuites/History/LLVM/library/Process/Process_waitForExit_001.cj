// EXEC: echo "os=%libdir/os/cangjieOS.cjo" > os.cfg
// EXEC: echo "io=%libdir/io/cangjieIO.cjo" >> os.cfg
// EXEC: %compiler -i os.cfg %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args
import os.*

func main(): Int64 {
    var proc: Process = Process.getProcessById(ProcessId(9295))
    var res = proc.getProcessName()
    print(res.toString())
    proc.waitForExit(5000)
    return 0
}

