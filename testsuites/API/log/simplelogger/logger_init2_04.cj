// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("./black1.txt",AccessMode.ReadWrite)
    fs.openFile()
    if(fs.openFile())
    {
        let logger: SimpleLogger = SimpleLogger("newlog","LogLevel.NO",fs) //EXPECTED: regex argument is mismatched with parameter type 'Enum-LogLevel'
    }
    0
}