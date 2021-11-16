// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args



func main(): Int64 {
    var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
    var value3 = map01[3]
    var value4 = map01[4]
    var value5 = map01[5]
    if (value3 == 3 && value4 == 5 && value5 == 6 ){
        return 0
    }
    return 1
}