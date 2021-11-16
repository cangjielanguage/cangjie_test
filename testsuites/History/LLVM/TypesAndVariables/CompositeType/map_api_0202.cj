// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<Int64,Int8> = #{1:2,2:3,4:5,5:2}
var map02:Map<Int64,Int8> = Map<Int64,Int8>(map01)
func case01(n:Int64):Int8{    
    var a = map01.get(n)
    var b:Int8 = match (a) {
        case Some(x) => x
        case $None => Int8(-1)
    }
    return b
}
func main(): Int64 {
    if (case01(1) == 2 && case01(2) == 3 && case01(4) == 5 && case01(5) == 2){
        return 0
    }
    return 1
}
