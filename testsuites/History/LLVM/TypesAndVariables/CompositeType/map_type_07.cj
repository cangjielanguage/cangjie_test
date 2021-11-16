// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var map01 = #{#{1,2}:100 , #{1,2,3}:200}
    var value1 = map01.getOrDefault(#{1,2}, 10)
    if ( value1 == 100 ){
        return 0
    }
    return 1
}