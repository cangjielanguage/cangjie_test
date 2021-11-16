// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %n%suffix %stdx_run_args
// EXEC : cat black1.txt
// EXEC : cat black1.txt | compare %f
// ASSERT: scan TRACE  %
// ASSERT: scan DEBUG  %
// ASSERT: scan INFO  %
// ASSERT: scan WARN  %
// ASSERT: scan ERROR  %
// ASSERT: scan INFO  %

from std import io.*
from std import log.*

func main(){
    var str2="%"
    var fs:FileStream = FileStream("./black1.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.ALL,fs)
    logger.trace(str2)
    logger.debug(str2)
    logger.info(str2)
    logger.warn(str2)
    logger.error(str2)
    logger.log(LogLevel.INFO,str2)
   fs.flush()
   fs.close()
    0
}