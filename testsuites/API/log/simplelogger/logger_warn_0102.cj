// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args| compare %f
// ASSERT: scan WARN Logger ======无参构造打印warn()方法日志========

from std import io.*
from std import log.*

func main(){
   var logger: SimpleLogger = SimpleLogger()
   logger.warn("======无参构造打印warn()方法日志========")
   logger.flush()
   0
}

