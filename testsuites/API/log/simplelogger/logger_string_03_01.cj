// DEPENDENCE: black1.txt
// EXEC: %compiler  %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC : cat black1.txt
// EXEC:  cat black1.txt | compare %f
// ASSERT: scan-begin TRACE ===================
// ASSERT: scan-next second============================
// ASSERT: scan-next second============================
// ASSERT: scan-next DEBUG ===================
// ASSERT: scan-next second============================
// ASSERT: scan-next second============================
// ASSERT: scan-next INFO ===================
// ASSERT: scan-next second============================
// ASSERT: scan-next second============================
// ASSERT: scan-next WARN ===================
// ASSERT: scan-next second============================
// ASSERT: scan-next second============================
// ASSERT: scan-next ERROR ===================
// ASSERT: scan-next second============================
// ASSERT: scan-next second============================
// ASSERT: scan-next INFO ===================
// ASSERT: scan-next second============================
// ASSERT: scan-next second============================

from std import io.*
from std import log.*

func main(){
    var str="===================\nsecond============================"
    var fs:FileStream = FileStream("./black1.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger(str,LogLevel.ALL,fs)
    logger.trace(str)
    logger.debug(str)
    logger.info(str)
    logger.warn(str)
    logger.error(str)
    logger.log(LogLevel.INFO,str)
    fs.flush()
    fs.close()
    0
}
