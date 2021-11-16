// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("./black1.txt",AccessMode.ReadWrite)
    fs.openFile()
    if(fs.openFile())
    {
        let logger: SimpleLogger = SimpleLogger("newlog",fs) // EXPECTED: regex-auto missing argument for call with parameter list: (Record-String, Enum-LogLevel, Class-FileStream)
    }
   fs.flush()
   fs.close()
    0
}