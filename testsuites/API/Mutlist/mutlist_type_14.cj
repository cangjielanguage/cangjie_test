// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func case01():String{
    return "a"
}

var rs = case01()
var r1 = Buffer<String>([rs])
var r2 = Buffer<String>([case01()])

func main(): Int64 {
    if ( r1.size() != 1 ){
        return 1
    }
    if ( r2.size() != 1 ){
        return 2
    }
    if ( r1[0] != "a"){
        return 3
    }
    if ( r2[0] != "a"){
        return 3
    }
    return 0
}
