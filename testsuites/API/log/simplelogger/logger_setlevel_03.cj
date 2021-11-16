// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.OFF,fs)
    logger.setLevel(LogLevel.None)  // EXPECTED: regex-auto 'None' is not a member of enum 'LogLevel'
    0
}
