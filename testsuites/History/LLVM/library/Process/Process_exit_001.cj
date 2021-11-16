// DEPENDENCE: os.cfg ../../resource/charlang_compiler/modules/io/cangjieIO.o ../../resource/charlang_compiler/modules/os/cangjieOS.o myprocess.o
// EXEC: %compiler %cmp_opt_os %f -o %output
// EXEC: %run %run_opt %output %run_args
import os.*

func main(): Int64 {
    var proc: Process = Process.getProcessById(ProcessId(9233))
    proc.exit(1)
    return 0
}

