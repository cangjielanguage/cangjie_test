// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)
var r2:Buffer<String> = Buffer<String>(["a","b","c"])
var m=r2[2]
func case01(){
    var a = r1.size()
    return a
}

func case02(){
    var a = r2.size()
    return a
}

func main(): Int64 {
    if ( case01() != 3 ){
        return 1
    }
    if ( case02() != 3 ){
        return 2
    }

    return 0
}
