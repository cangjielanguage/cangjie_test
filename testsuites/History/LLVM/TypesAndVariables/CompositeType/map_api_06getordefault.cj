// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<Int16,Int16> = #{3:3,3:5}
var value = map01.getOrDefault(3, 10)
func main(): Int64 {
    if (value != 5){
        return 1
    }
    return 0
}