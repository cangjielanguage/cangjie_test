// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: scan RuntimeException

from std import io.*
from std import log.*

func main(){
    var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    fs.close()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.ALL,fs)
    0
}
