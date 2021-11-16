// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("./black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    let logger: SimpleLogger = SimpleLogger("",LogLevel.WARN,fs)
    var levels=logger.getLevel().toString()
    if("${levels}" == "WARN")
    {
        print("success:init设置level为WARN\n")
    }
    fs.flush()
    fs.close()
    0
}