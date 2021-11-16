// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<Int16,Int16> = #{3:3,4:5}
var map02 = map01.put(5, 6)
var value = map02.getOrDefault(5, 10)
func main(): Int64 {
    if (value == 6 && map02.size() == 3){
        return 0
    }
    return 1
}