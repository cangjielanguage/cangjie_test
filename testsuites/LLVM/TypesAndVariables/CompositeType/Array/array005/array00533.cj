// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*

func main(): Int64 {
    let a : HashSet<Int64> = HashSet<Int64>([1])
    let b = HashSet<Int64>([0,1])
    var c = a.contains(1)
    var d = b.contains(1)
    var e = b.contains(0)
    if(c && d && e){
        return 0
    }
    return 1
}