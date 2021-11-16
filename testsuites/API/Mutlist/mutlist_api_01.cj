// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var r:Buffer<Int64> = Buffer<Int64>()

func case01(){
    var a = r.size()
    return a
}

func main(): Int64 {

    if ( case01() != 0 ){
        return 1
    }
    return 0
}