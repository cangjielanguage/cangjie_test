// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var map01:HashMap<Int64,Int64> = HashMap<Int64,Int64>()
    var set_keys1 = map01.keys()
    var set_keys:HashSet<Int64> = HashSet<Int64>()
    if (set_keys1 != set_keys){
        return 1
    }
    return 0
}