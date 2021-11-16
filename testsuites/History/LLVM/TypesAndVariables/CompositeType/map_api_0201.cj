// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int64,String> = #{1:"你"}
var map02:Map<Int64,String> = Map<Int64,String>(map01)
var set_keys:Set<Int64> = #{1}
var list_values:List<String> = ["你"]
func main(): Int64 {
    if (map02.keys() == set_keys && map02.values() == list_values){
        return 0
    }
    return 1
}