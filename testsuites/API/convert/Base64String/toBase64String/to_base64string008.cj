// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*

func main():Int64 {
    var res1 = toBase64String(Array<UInt8>([65]))  // A -> Base64
    var res2 = toBase64String(Array<UInt8>([97])) // a -> Base64

    if (res1 != "QQ==") {
        return 1
    }
    if (res2 != "YQ=="){
        return 1
    }
    return 0
}