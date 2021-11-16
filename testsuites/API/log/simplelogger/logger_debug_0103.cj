// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: %ls -l black1.txt*
// EXEC: cat black1.txt*
// EXEC: cat black1.txt* | compare %f
// ASSERT: scan DEBUG Logger ======无参，设置输出，打印debug()方法日志========

from std import io.*
from std import log.*

func main(){
   let logger: SimpleLogger = SimpleLogger()
   var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
   fs.openFile()
   logger.setLevel(LogLevel.ALL)
   logger.setOutput(fs)
   logger.debug("======无参，设置输出，打印debug()方法日志========")
   fs.flush()
   fs.close()
   0
}

