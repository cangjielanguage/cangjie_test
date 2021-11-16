// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var map01:HashMap<Int8,Int8> =HashMap<Int8,Int8>([(1,2),(2,3),(4,5),(5,2),(1,5)])

func case01(n:Int8):Int8{
    var a = map01.get(n)
    var b = match (a) {
        case Some(x) => x
        case None => 1
    }
    return b
}

func main(): Int64 {
    if ( case01(1) == 5 && case01(2) == 3 && case01(4) == 5 && case01(5) == 2){
        return 0
    }
    return 1
}