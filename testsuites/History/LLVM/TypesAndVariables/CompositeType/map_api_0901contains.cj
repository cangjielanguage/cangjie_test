// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
var bool7 = map01.contains(7)
func main(): Int64 {
    if ( !bool7  ){
        return 0
    }
    return 1
}
