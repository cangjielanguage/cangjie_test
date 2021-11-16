// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<HashMap<Int64,String>> =List<HashMap<Int64,String>>([HashMap<Int64,String>(),HashMap<Int64,String>()])
var r1:HashSet<HashMap<Int64,String>> = HashSet<HashMap<Int64,String>>(str) // EXPECTED: regex error.*?generics type arguments do not match the constraint
var r2:HashSet<HashMap<Int64,String>> = HashSet<HashMap<Int64,String>>([HashMap<Int64,String>(),HashMap<Int64,String>()]) // EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}
