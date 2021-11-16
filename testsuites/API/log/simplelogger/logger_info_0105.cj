// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: %ls -l black1.txt* 2>&1 | compare %f
// ASSERT: regex-auto ls: cannot access 'black1.txt*': No such file or directory

from std import io.*
from std import log.*

func main(){
   let logger: SimpleLogger = SimpleLogger()
   var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
   logger.setLevel(LogLevel.ERROR)
   logger.setOutput(fs)
   logger.info("======无参，设置level，打印info()方法日志========")
   fs.flush()
   fs.close()
   0
}
