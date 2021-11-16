// DEPENDENCE: black2.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: %ls -l
// EXEC: cat black2.txt*
// EXEC: cat black2.txt* | compare %f
// ASSERT: scan absbsssss
// ASSERT: scan-not OFF Logger ======打印OFF的msg========
// ASSERT: scan ERROR Logger ======打印ERROR的msg========
// ASSERT: scan-not INFO Logger ======打印INFO的msg========
// ASSERT: scan-not DEBUG Logger ======打印DEBUG的msg========
// ASSERT: scan WARN Logger ======打印WARN的msg========
// ASSERT: scan-not ALL Logger ======打印ALL的msg========

from std import io.*
from std import log.*

func main(){
   let logger: SimpleLogger = SimpleLogger()
   var fs = FileStream("black2.txt", AccessMode.WriteOnly, OpenMode.Append)
   fs.openFile()
   logger.setOutput(fs)
   logger.setLevel(LogLevel.WARN)
   logger.log(LogLevel.OFF,"======打印OFF的msg========")
   logger.log(LogLevel.ERROR,"======打印ERROR的msg========")
   logger.log(LogLevel.INFO,"======打印INFO的msg========")
   logger.log(LogLevel.DEBUG,"======打印DEBUG的msg========")
   logger.log(LogLevel.WARN,"======打印WARN的msg========")
   logger.log(LogLevel.ALL,"======打印ALL的msg========")
   fs.flush()
   fs.close()
   0
}

