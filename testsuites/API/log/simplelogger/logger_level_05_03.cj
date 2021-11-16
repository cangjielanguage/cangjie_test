// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: ls -l
// EXEC: cat black1.txt* | compare %f
// ASSERT: scan ======DEBUG打印出来========

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("./black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.ALL,fs)
    logger.log(LogLevel.DEBUG, "======DEBUG打印出来========！")
    fs.flush()
    fs.close()
    0
}