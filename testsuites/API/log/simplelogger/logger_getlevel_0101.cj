// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// ASSERT: scan success

from std import io.*
from std import log.*

func main(){
    let logger:SimpleLogger = SimpleLogger()
    var levels=logger.getLevel().toString()
    if("${levels}" == "INFO")
    {
        print("success\n")
    }
    0
}