// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var map01 = HashMap<Int64,String>()
var set_keys:HashSet<Int64> = HashSet<Int64>()
var list_values:List<String> = []
func main(): Int64 {
    if (map01.keys() == set_keys && map01.values() == list_values){
        return 0
    }
    return 1
}