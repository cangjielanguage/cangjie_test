// EXEC: %compiler %stdx_cmp_opt  %f -o %output  2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
    let logger: SimpleLogger = SimpleLogger()
    var st='m'
    logger.setOutput(st)// EXPECTED: regex-auto argument is mismatched with parameter type 'Class-FileStream'
    0
}
