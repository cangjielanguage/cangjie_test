// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:String="abs"
var r1:HashSet<String> = HashSet<String>("abs")   // EXPECTED: regex error.*?no matching constructor for call 'HashSet'
var r2:HashSet<String> = HashSet<String>(str)   // EXPECTED: regex error.*?no matching constructor for call 'HashSet'

func main(): Int64 {
    return 0
}