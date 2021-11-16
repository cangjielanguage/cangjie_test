 // EXEC: %compiler %stdx_cmp_opt %f -o %output
 // EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var setOne = HashSet<Int64>()
func main(): Int64 {
    if (setOne.contains(1)) {
        return 1
    }
    return 0
}