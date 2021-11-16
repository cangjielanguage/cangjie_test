// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str=Array<Int64>([1,2])
var r1= HashSet<Array<Int64>>(str)      // EXPECTED: regex error.*?parameters and arguments mismatch

func main(): Int64 {
    return 0
}