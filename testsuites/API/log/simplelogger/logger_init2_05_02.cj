// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
    var fs ='m'
    let logger: SimpleLogger = SimpleLogger("newlog",LogLevel.INFO,fs) // EXPECTED: regex-auto argument is mismatched with parameter type 'Class-FileStream'
    fs.openFile()
    fs.flush()
    fs.close()
    0
}