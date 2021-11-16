// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var map01:HashMap<Int64,Int8> = HashMap<Int64,Int8>([(1,2),(2,3),(4,5),(5,2),(1,5)])
var map02:HashMap<Int64,Int8> = HashMap<Int64,Int8>(map01)
var set_keys:HashSet<Int64> =HashSet<Int64>([1,2,4,5])
var list_values:List<Int8> =List<Int8>([5, 3, 5, 2])
func main(): Int64 {
    if (map02.keys() == set_keys && map02.values() == list_values){
        return 0
    }
    return 1
}