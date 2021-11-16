 // EXEC: %compiler %stdx_cmp_opt %f -o %output
 // EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var setOne: HashSet<Int64> = HashSet<Int64>([1,2,3,3])
var set2: HashSet<Int64> =HashSet<Int64> ()
func main(): Int64 {
    if (setOne.size() != 3) {
        return 1
    }
    if (set2.size() != 0) {
        return 2
    }
    return 0
}