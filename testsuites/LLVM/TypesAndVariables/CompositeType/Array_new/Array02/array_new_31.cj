// EXEC-PIPE-1: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped
from std import collection.*

var a = Array<Int64>(HashMap<Int64,String>(1,"5")) // EXPECTED: regex no matching constructor for call 'HashMap'

func main(): Int64 {
    let b = Array<Int64>(HashMap<Int64,String>()) // EXPECTED: regex no matching constructor for call 'HashMap'
    return 0
}
