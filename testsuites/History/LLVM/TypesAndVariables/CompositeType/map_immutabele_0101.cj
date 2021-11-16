// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01 = #{1:2,2:3}
func foo(map01:Map<Int64,Int64>){
    map01.put(1,5)
    return map01
}
func main(): Int64 {
    var map02 = foo(map01)
    var value1 = map02.getOrDefault(1, 10)
    var value2 = map02.getOrDefault(2, 10)
    if ( value1 == 2 && value2 == 3 && map02.size() == 2){
        return 0
    }
    return 1
}