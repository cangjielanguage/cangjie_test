// DEPENDENCE: black1.txt
// EXEC: %compiler  %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: cat black1.txt* | compare %f
// ASSERT: scan-not ======OFF打印出来========

from std import io.*
from std import log.*

func main(){
    var fs = FileStream("./black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.OFF,fs)
    logger.log(LogLevel.OFF, "======OFF打印出来========")
    fs.flush()
    fs.close()
    0
}