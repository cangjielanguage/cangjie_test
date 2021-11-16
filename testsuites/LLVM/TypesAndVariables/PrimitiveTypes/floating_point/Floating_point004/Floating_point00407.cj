// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64 {
    var a = NaN64
    var b = NaN64
    if (a-b>0.0001) {
        return 1
    }
    return 0
}
