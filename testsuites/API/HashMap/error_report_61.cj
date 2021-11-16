// EXEC-PIPE-1:%compiler %stdx_cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

from std import collection.*
var map:HashMap<Int64,Int64> =HashMap<Int64,Int64>([1,(2,1),1]) // EXPECTED: regex error.*?cannot convert an integer literal to type 'Tuple<Int64, Int64>'

func main():Int64 {
    return 0
}
