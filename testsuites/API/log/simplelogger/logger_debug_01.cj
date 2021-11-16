// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: grep $(date +"%Y/%m/%d\s%H:%M") black1.txt
// EXEC: cat black1.txt* | compare %f
// ASSERT: regex (\d{4})/(\d{2})/(\d{2}) (\d{2}):(\d{2}):(\d{2}).*?DEBUG newlog ======有参构造打印debug方法日志========

from std import io.*
from std import log.*

func main(){
   var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
   fs.openFile()
   var logger: SimpleLogger = SimpleLogger("newlog",LogLevel.ALL,fs)
   logger.debug("======有参构造打印debug方法日志========")
   fs.flush()
   fs.close()
   0
}

