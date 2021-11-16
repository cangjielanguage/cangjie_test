// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan enum sugar access 'e' conflict with function name, try to use with prefix
import ast.*

enum E{|e}

external macro e(x:Tokens){x}

func main(): Int64 {
    var a = e
    return 0
}
