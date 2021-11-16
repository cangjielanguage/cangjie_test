// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var map02 = #{true:2,false:5}
    var map04 :Map<Bool,Int64> = Map<Bool,Int64>(map02)
    var value2 = map04.getOrDefault(false, 10)
    if ( value2 != 5){
        return 1
    }
    return 0
}
