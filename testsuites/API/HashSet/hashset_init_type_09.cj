// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str=Result<Int64>.Ok(100)
var r1= HashSet<Result<Int64>>(str)      // EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}
