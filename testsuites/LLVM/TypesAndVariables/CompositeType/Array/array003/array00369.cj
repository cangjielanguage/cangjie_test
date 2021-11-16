// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*

func main(){
    let mySet : HashSet<Int64> = HashSet<Int64>([1,2,3])
    let a = Array<Int32>(5,Int32(mySet.size()))
    return a[4] - 3
}
