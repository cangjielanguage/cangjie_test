// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var map01 = #{1:2,2:3,1:1}
    var map02 = #{1:1,2:2,2:3}
    if (map01 == map02){
        return 0
    }
    return 1
}