// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("./test1.txt",AccessMode.ReadWrite)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger()
    logger.setOutput()  //EXPECTED: regex-auto missing argument for call with parameter list: (Class-FileStream)
    0
}
