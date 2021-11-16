// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %n%suffix %stdx_run_args
// EXEC: echo "black1.txt文件内容结束" >>black1.txt
// EXEC: echo "black2.txt文件内容结束" >>black2.txt
// EXEC: cat black1.txt black2.txt >black3.txt
// EXEC: cat black3.txt | compare %f
// ASSERT: scan ===打印A日志===
// ASSERT: scan ===打印B日志===
// ASSERT: scan black1.txt文件内容结束
// ASSERT: scan ===打印C日志===
// ASSERT: scan ===打印D日志===
// ASSERT: scan ===打印E日志===
// ASSERT: scan ===打印F日志===
// ASSERT: scan black2.txt文件内容结束

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("./black1.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("newlog",LogLevel.ALL,fs)
    logger.trace( "===打印A日志===")
    logger.debug( "===打印B日志===")
    var fs1:FileStream = FileStream("./black2.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs1.openFile()
    logger.setOutput(fs1)
    logger.info( "===打印C日志===")
    logger.warn( "===打印D日志===")
    logger.error( "===打印E日志===")
    logger.log(LogLevel.INFO, "===打印F日志===")
    fs.flush()
    fs.close()
    fs1.flush()
    fs1.close()
    0
}