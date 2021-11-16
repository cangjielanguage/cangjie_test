// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var map01:HashMap<Int64,Int8> = HashMap<Int64,Int8>([(1,2),(2,3),(3,4),(4,5),(5,2)])
var map02:HashMap<Int64,Int8> = HashMap<Int64,Int8>(map01)
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
