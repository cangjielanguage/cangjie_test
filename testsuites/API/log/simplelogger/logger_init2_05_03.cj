// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: ls -l
// EXEC: cat black1.txt | compare %f
// ASSERT: scan  INFO newlog =========

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("newlog",LogLevel.ALL,fs)
    logger.info("=========")
    fs.flush()
    fs.close()
    0
}
