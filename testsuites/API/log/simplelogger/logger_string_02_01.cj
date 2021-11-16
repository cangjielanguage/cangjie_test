// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC : cat black1.txt
// EXEC : cat black1.txt | compare %f
// ASSERT: scan TRACE  #
// ASSERT: scan DEBUG  #
// ASSERT: scan INFO  #
// ASSERT: scan WARN  #
// ASSERT: scan ERROR  #
// ASSERT: scan INFO  #

from std import io.*
from std import log.*

func main(){
    var str1="#"
    var fs:FileStream = FileStream("black1.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.ALL,fs)
    logger.trace(str1)
    logger.debug(str1)
    logger.info(str1)
    logger.warn(str1)
    logger.error(str1)
    logger.log(LogLevel.INFO,str1)
   fs.flush()
   fs.close()
    0
}