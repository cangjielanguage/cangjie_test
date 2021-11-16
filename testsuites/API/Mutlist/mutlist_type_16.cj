// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var rs : Buffer<String>= Buffer<String>(["a"])
    var r1 = Buffer<Buffer<String>>([rs])
    var r2 = Buffer<Buffer<String>>([Buffer<String>(["a"])])

    if ( r1.size() != 1 ){
        return 1
    }
    if ( r2.size() != 1 ){
        return 2
    }
    if ( r2[0][0] != "a"){
        return 3
    }
    if ( r1[0][0] != "a"){
        return 4
    }
    return 0
}
