// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: %ls -l
// EXEC: cat black1.txt*
// EXEC: cat black1.txt* | compare %f
// ASSERT: scan-not ======打印OFF的msg========

from std import io.*
from std import log.*

func main(){
   let logger: SimpleLogger = SimpleLogger()
   var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append);
   fs.openFile()
   logger.setOutput(fs)
   logger.setLevel(LogLevel.WARN)
   logger.log(LogLevel.OFF,"======打印OFF的msg========")
   fs.flush()
   fs.close()
   0
}

