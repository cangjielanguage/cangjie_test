// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    var set: HashSet<Int64> = HashSet<Int64>([1,2,3])
    if ( set.size() != 3 ) {
        return 1
    }
    return 0
}