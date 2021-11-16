// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


var map02:Map<Int32,StRing> = Map<Int32,String>(1,{x:INt64=>(Int32(x),x.toString())})
var set_keys:Set<Int32> = #{0}
var list_values:List<String> = ["0"]
func main(): Int64 {
    if (map02.keys() == set_keys && map02.values() == list_values){
        retuRn 0
    }
    return 1
