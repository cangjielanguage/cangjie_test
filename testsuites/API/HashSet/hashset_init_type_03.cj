// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<Int64>=[1,2]
var r1= HashSet<List<Int64>>([1,2])    // EXPECTED: regex error.*?no matching constructor for call 'HashSet'
var r2= HashSet<List<Int64>>(str)      // EXPECTED: regex error.*?no matching constructor for call 'HashSet'

func main(): Int64 {
    return 0
}