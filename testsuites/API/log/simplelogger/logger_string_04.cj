// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: cat black1.txt*
// EXEC: cat black1.txt* | compare %f
// ASSERT: scan TRACE 中中中 中中中
// ASSERT: scan DEBUG 中中中 中中中
// ASSERT: scan INFO 中中中 中中中
// ASSERT: scan WARN 中中中 中中中
// ASSERT: scan ERROR 中中中 中中中
// ASSERT: scan INFO 中中中 中中中

from std import io.*
from std import log.*

func main(){
    var str="中中中"
    var fs:FileStream = FileStream("./black1.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger(str,LogLevel.ALL,fs)
    logger.trace("中中中")
    logger.debug("中中中")
    logger.info("中中中")
    logger.warn("中中中")
    logger.error("中中中")
    logger.log(LogLevel.INFO,"中中中")
    fs.flush()
    fs.close()
    0
}