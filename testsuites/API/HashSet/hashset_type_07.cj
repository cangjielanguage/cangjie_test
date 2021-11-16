// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
var intSet:List<HashSet<Int64>> = [HashSet<Int64>([0, 1, 2, 3, 4])]
var r1:HashSet<HashSet<Int64>> = HashSet<HashSet<Int64>>(intSet) // EXPECTED: regex error.*?generics type arguments do not match the constraint
var r2:HashSet<HashSet<Int64>> = HashSet<HashSet<Int64>>(HashSet<Int64>([0, 1, 2, 3, 4]))// EXPECTED: regex error.*?generics type arguments do not match the constraint

    return 0
}
