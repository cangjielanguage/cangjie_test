// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int32,Int32> = #{3:3,4:5}
var map02 = map01.put(3, 3)
var value = map02.getOrDefault(3, 10)
func main(): Int64 {
    if (value == 3 && map02.size() == 2 ){
        return 0
    }
    return 1
}