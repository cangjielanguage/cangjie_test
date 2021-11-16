// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import io.*
from std import log.*

from std import io.*
func main(){
    var fs:FileStream = FileStream("./black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.TRACE,fs)
    var levels=logger.getLevel().toString()
    if("${levels}" == "TRACE")
    {
        print("success:init设置level为TRACE\n")
    }
    fs.flush()
    fs.close()
    0
}