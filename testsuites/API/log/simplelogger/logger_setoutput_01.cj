// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: ls -l | compare %f
// ASSERT: scan black1.txt

from std import io.*
from std import log.*

func main(){
    let logger: SimpleLogger = SimpleLogger()
    var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    logger.setOutput(fs)
   fs.flush()
   fs.close()
    0
}