// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map = #{1:2,2:3}
var values = map.values()
func main(): Int64 {
    if ( values.size() == 2){
        return 0
    }
    return 1
}
