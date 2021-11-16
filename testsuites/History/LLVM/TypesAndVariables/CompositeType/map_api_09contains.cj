// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
var bool3 = map01.contains(3)
var bool4 = map01.contains(4)
var bool5 = map01.contains(5)
func main(): Int64 {
    if ( bool3  && bool4  && bool5 ){
        return 0
    }
    return 1
}