// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %n%suffix %stdx_run_args
// EXEC :  cat black1.txt
// ASSERT: scan A

from std import io.*
from std import log.*

func main(){
    var str3="A"
    var fs:FileStream = FileStream("./black1.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.ALL,fs)
    logger.trace(str3)
    logger.debug(str3)
    logger.info(str3)
    logger.warn(str3)
    logger.error(str3)
    logger.log(LogLevel.INFO,str3)
    fs.flush()
    fs.close()
    0
}