// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
    var list_keys:ArrayList<Int64> = ArrayList<Int64>([7,8])
    var map03 = map01.removeAll(list_keys)
    var value3 = map03.getOrDefault(3, 10)
    var value4 = map03.getOrDefault(4, 10)
    var value5 = map03.getOrDefault(5, 10)
    if ( value3 == 3 && value4 == 5 && value5 == 6 && map03.size() == 3){
        return 0
    }
    return 1
}
