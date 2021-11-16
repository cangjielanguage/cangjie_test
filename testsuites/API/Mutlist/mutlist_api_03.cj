// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var r1:Buffer<String> = Buffer<String>(3)
var r2:Buffer<String> = Buffer<String>(0)
var r3:Buffer<String> = Buffer<String>(1000)

func case01(){
    var a = r1.size()
    return a
}

func case02(){
    var a = r2.size()
    return a
}

func case03(){
    var a = r3.size()
    return a
}

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    if ( case02() != 0 ){
        return 2
    }
    if ( case03() != 0 ){
        return 3
    }
    return 0
}
