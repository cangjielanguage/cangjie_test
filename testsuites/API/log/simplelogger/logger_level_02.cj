// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import io.*
from std import log.*

func main(){
    var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.ERROR,fs)
    var levels=logger.getLevel().toString()
    if("${levels}" == "ERROR")
    {
        print("success:init设置level为ERROR\n")
    }
    0
}
