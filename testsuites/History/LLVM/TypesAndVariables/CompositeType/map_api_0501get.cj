// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01:Map<Int16,Int16> = #{1:2,2:3,4:5,5:2,1:5}

func case01(n:Int16):Int16{
    var a = map01.get(n)
    var b = match (a) {
        case Some(x) => x
        case None => 1
    }
    return b
}

func main(): Int64 {
    if ( case01(10) == 1 ){
        return 0
    }
    return 1
}