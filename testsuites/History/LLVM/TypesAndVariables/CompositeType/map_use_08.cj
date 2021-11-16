// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map = #{1:2,2:3}
var value1 = map.getOrDefault(1, 10)
var value2 = map.getOrDefault(2, 10)
func foo(value1:Int64){
    return value2
}
func main(): Int64 {
    if ( foo(value1) == 3){
        return 0
    }
    return 1
}