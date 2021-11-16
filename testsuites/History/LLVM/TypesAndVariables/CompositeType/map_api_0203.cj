// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int64,Int8> = #{1:2,2:3,4:5,5:2,1:5}
var map02:Map<Int64,Int8> = Map<Int64,Int8>(map01)
var set_keys:Set<Int64> = #{1,2,4,5}
var list_values:List<Int8> = [2, 3, 5, 2]
func main(): Int64 {
    if (map02.keys() == set_keys && map02.values() == list_values){
        return 0
    }
    return 1
}