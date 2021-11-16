// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<Int64,Int64> = #{}
var set_keys:Set<Int64> = #{}
var list_values:List<Int64> = []
func main(): Int64 {

    if (map01.keys() == set_keys && map01.values() == list_values){
        return 0
    }
    return 1
}