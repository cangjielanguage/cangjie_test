// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var map01:HashMap<Int64,Int64> = HashMap<Int64,Int64>()
var map02:HashMap<Int64,Int64> = HashMap<Int64,Int64>(map01)
var set_keys:HashSet<Int64> = HashSet<Int64>()
var list_values:List<Int64> = []
func main(): Int64 {
    if (map02.keys() == set_keys && map02.values() == list_values){
        return 0
    }
    return 1
}