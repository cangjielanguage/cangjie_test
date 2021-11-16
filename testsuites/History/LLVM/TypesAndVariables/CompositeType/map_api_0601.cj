// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int8,Int8> = #{3:3,3:5}
var value = map01.getOrDefault(2, 10)
func main(): Int64 {
    if (value != 10){
        return 1
    }
    return 0
}