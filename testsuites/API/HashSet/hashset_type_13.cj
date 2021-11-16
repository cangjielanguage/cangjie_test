// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

from std import collection.*

var str:List<Array<Int64>> =List<Array<Int64>>([Array<Int64>(),Array<Int64>()])
var r1:HashSet<Array<Int64>> = HashSet<Array<Int64>>(str)
var r2:HashSet<Array<Int64>> = HashSet<Array<Int64>>([Array<Int64>(),Array<Int64>()])

func main(): Int64 {
    return 0
}
