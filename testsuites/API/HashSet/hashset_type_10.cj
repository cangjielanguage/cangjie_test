// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var r1:HashSet<Option<Int64>> = HashSet<Option<Int64>>([Option<Int64>.Some(100),Option<Int64>.Some(10)])// EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}
