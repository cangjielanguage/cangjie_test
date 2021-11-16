// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var str:List<HashMap<Int64,Int64>>=List<HashMap<Int64,Int64>>([HashMap<Int64,Int64>([(2,3),(3,4)])])
    var r1:HashSet<HashMap<Int64,Int64>> = HashSet<HashMap<Int64,Int64>>(str)// EXPECTED: regex error.*?no matching constructor for call 'HashSet'
    var r2:HashSet<HashMap<Int64,Int64>> = HashSet<HashMap<Int64,Int64>>([HashMap<Int64,Int64>([(2,3),(3,4)])])//EXPECTED: regex error.*?no matching constructor for call 'HashSet'
    return 0
}