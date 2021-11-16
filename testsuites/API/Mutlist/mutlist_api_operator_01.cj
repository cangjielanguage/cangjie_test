// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)

func case01(x:Int64){
    var a = r1[x]
    return a
}

func main(): Int64 {
    if ( case01(0) != "a" ){
        return 1
    }
    if ( case01(1) != "b" ){
        return 2
    }
    return 0
}
