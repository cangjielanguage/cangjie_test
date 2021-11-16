// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var rs = Array<UInt8>([3,4])
    var r1 = Buffer<Array<UInt8>>([rs])
    var r2 = Buffer<Array<UInt8>>([Array<UInt8>([3,4])])

    if ( r1.size() != 1 ){
        return 1
    }
    if ( r2.size() != 1 ){
        return 2
    }
    if ( r2[0][0] != UInt8(3)){
        return 3
    }
    if ( r2[0][1] != UInt8(4)){
        return 4
    }
    if ( r1[0][0] != UInt8(3)){
        return 5
    }
    if ( r1[0][1] != UInt8(4)){
        return 6
    }
    return 0
}
