// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

from std import collection.*
func main(): Int64 {
    var setOne = HashSet<Int64>([Int32(1),Int64(1)]) // EXPECTED: regex error.*?inconsistent element type for List literal
    return 0
}
