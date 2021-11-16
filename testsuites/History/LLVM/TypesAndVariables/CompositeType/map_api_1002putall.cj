// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int8,Int8> = #{3:3,4:5,5:6}
var map02:Map<Int8,Int8> = #{3:1,4:5,6:3}
var map03 = map01.putAll(map02)
var value3 = map03.getOrDefault(3, 10)
var value4 = map03.getOrDefault(4, 10)
var value5 = map03.getOrDefault(5, 10)
var value6 = map03.getOrDefault(6, 10)
func main(): Int64 {
    if ( value3 == 1 && value4 == 5 && value5 == 6 && value6 == 3 && map03.size() == 4){
        return 0
    }
    return 1
}