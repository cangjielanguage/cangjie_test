// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*

func main():Int64 {
    var res1 = toBase64String(Array<UInt8>([65,66,67,65,66,67]))  // ABC -> Base64
    var res2 = toBase64String(Array<UInt8>([97,98,99,65,66,67])) // abc -> Base64
    if (res1 != "QUJDQUJD") {
        return 1
    }
    if (res2 != "YWJjQUJD"){
        return 1
    }
    return 0
}