// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*

func main(): Int64 {
    let b = Array<HashSet<Int64>>([HashSet<Int64>([1,2,3]),HashSet<Int64>([4,5,6])])
    b.reverse()

    if(b[0] != HashSet<Int64>([4,5,6]) || b[1] != HashSet<Int64>([1,2,3])){
      return 2
    }
    return 0
}