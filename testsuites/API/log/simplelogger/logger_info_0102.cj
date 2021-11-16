// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: regex (\d{4})/(\d{2})/(\d{2}) (\d{2}):(\d{2}):(\d{2}).*?INFO Logger ======打印info方法日志========

from std import io.*
from std import log.*

func main(){
   var logger: SimpleLogger = SimpleLogger()
   logger.info("======打印info方法日志========")
   logger.flush()
   0
}
