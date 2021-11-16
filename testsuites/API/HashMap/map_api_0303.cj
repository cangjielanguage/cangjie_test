// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var map02:HashMap<Int32,String> = HashMap<Int32,String>(5,{x:Int64=>(Int32(1),x.toString())})
var set_keys:HashSet<Int32> = HashSet<Int32>([1])
var list_values:List<String> = ["4"]
func main(): Int64 {
    if (map02.keys() == set_keys && map02.values() == list_values){
        return 0
    }
    return 1
}