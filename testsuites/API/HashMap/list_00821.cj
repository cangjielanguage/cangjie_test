// EXEC-PIPE-1: %compiler %stdx_cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

from std import collection.*
func main(): Int64 {
    var a : HashMap<List<Int64>,List<Int64>> =HashMap<List<Int64>,List<Int64>>([([1],[1])]) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 1
}
