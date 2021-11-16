// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
    let logger: SimpleLogger = SimpleLogger("newlog","LogLevel.INFO","./black1.txt") //EXPECTED: regex argument is mismatched with parameter type 'Enum-LogLevel'
    0
}