// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*

func main():Int64 {
    var res1 = toBase64String(Array<UInt8>([65,66,67]))
    var res2 = toBase64String(Array<UInt8>([97,98,99]))
    if (res1 != "QUJD") {
        return 1
    }
    if (res2 != "YWJj"){
        return 1
    }
    return 0
}