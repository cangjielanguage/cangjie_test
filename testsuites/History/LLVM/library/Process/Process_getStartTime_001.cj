// EXEC: echo "os=%libdir/os/cangjieOS.cjo" > os.cfg
// EXEC: echo "io=%libdir/io/cangjieIO.cjo" >> os.cfg
// EXEC: %compiler -i os.cfg %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args
import os.*

func main(): Int64 {
    //var proc: Process = Process()
    //proc.start("myprocess.o")
    var proc: Process = Process.getProcessById(ProcessId(1))
    var res = proc.getStartTime()
    print(res.toString())
    return 0
}

