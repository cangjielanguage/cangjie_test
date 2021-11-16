// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<IntNative,IntNative> = #{1:2}
var map02:Map<UIntNative,UIntNative> = #{1:2}
var value1 = map01.getOrDefault(1, 10)
var value2 = map02.getOrDefault(1, 10)
func main(): Int64 {
    if ( value1 == 2 && value2 == 2 ){
        return 0
    }
    return 1
}