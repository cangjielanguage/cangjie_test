// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args



func main(): Int64 {
    var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
    var set_keys1 = map01.keys()
    var set_keys:Set<Int64> = #{3,4,5}
    if (set_keys1 != set_keys){
        return 1
    }
    return 0
}