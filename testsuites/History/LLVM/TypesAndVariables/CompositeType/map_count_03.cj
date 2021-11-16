// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int16,Int16> = #{1:2,2:3,3:4}
var map02:Map<Int16,Int16> = Map<Int16,Int16>(map01)
func main(): Int64 {
    if (map02.size() == 3){
        return 0
    }
    return 1
}