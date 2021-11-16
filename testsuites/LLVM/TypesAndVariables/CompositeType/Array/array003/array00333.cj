// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import collection.*

func main(): Int64{
    let mySet : HashSet<Int64> = HashSet<Int64>([1,2,3])
    let a = Array<Int32>(mySet.size(),5)
    return Int64(a[0] - a[1] + a[0] - a[2])
}
