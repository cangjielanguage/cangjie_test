// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map02:Map<Int32,String> = Map<Int32,String>(1,{x:Int64=>(Int32(x),x.toString())})
var set_keys:Set<Int32> = #{0}
var list_values:List<String> = ["0"]
func main(): Int64 {
    if (map02.keys() == set_keys && map02.values() == list_values){
        return 0
    }
    return 1
}