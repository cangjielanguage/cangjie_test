// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var list1: List<List<Int64>>= [[1,2],[3,4]]
var r1:HashSet<List<Int64>> = HashSet<List<Int64>>(list1) // EXPECTED: regex error.*?generics type arguments do not match the constraint
var r2:HashSet<List<Int64>> = HashSet<List<Int64>>([[1,2],[3,4]])   // EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}
