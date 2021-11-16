// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01 = #{1:2,2:3}
func foo(map01:Map<Int64,Int64>){
    map01.put(1,5)
    return map01
}
func main(): Int64 {
    var value = foo(map01).getOrDefault(1, 10)
    if ( value == 2){
        return 0
    }
    return 1
}