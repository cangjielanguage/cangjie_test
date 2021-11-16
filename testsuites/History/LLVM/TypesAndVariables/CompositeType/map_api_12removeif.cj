// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func aaa(a:Int64,b:Int64): Bool{
    if(a == 3 && b == 3){
        return true
    }
    return false
}
func main(): Int64 {
    var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
    var map03 = map01.removeIf(aaa)
    var value3 = map03.getOrDefault(3, 10)
    var value4 = map03.getOrDefault(4, 10)
    var value5 = map03.getOrDefault(5, 10)
    if ( value3 == 10 && value4 == 5 && value5 == 6 && map03.size() == 2){
        return 0
    }
    return 1
}

