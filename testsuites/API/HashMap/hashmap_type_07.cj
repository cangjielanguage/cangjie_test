// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*
func main(): Int64 {
    var HashMap01:HashMap<HashSet<Int64>,List<Int64>> = HashMap<HashSet<Int64>,List<Int64>>([(HashSet<Int64>([1]),[1])])//EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 0
}