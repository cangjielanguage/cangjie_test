// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not TRACE Logger ======无参构造打印trace()方法日志========

from std import io.*
from std import log.*

func main(){
   var logger: SimpleLogger = SimpleLogger()
   logger.trace("======无参构造打印trace()方法日志========")
   logger.flush()
   0
}

