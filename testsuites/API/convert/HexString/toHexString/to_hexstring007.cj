// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*

func main():Int64 {
    var res1 = toHexString(Array<UInt8>([65,66,67,65,66,67]))  // ABC -> Hex
    var res2 = toHexString(Array<UInt8>([97,98,99,65,66,67])) // abc -> Hex
    if (res1 != "414243414243") {
        return 1
    }
    if (res2 != "616263414243"){
        return 1
    }
    return 0
}