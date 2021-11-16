// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
var map02 = map01.remove(5)
var value3 = map02.getOrDefault(3, 10)
var value4 = map02.getOrDefault(4, 10)
var value5 = map02.getOrDefault(5, 10)
func main(): Int64 {
    if (value3 == 3 && value4 == 5 && value5 == 10 && map02.size() == 2){
        return 0
    }
    return 1
}
