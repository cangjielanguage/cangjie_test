// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*


func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case $None => default
    }
    return result
}

func main():Int64 {
    var opt1 = fromBase64String("TW=U")
    var opt2 = fromBase64String("=TWU")
    var opt3 = fromBase64String("=TW=")
    var opt4 = fromBase64String("=T==")
    var opt5 = fromBase64String("T===")
    var res1 = matchResult<Array<UInt8>>(opt1, Array<UInt8>())
    var res2 = matchResult<Array<UInt8>>(opt2, Array<UInt8>())
    var res3 = matchResult<Array<UInt8>>(opt3, Array<UInt8>())
    var res4 = matchResult<Array<UInt8>>(opt4, Array<UInt8>())
    var res5 = matchResult<Array<UInt8>>(opt5, Array<UInt8>())

    if (res1.size() == 0 && res2.size() == 0 && res3.size() == 0 && res4.size()==0 && res4.size()==0) {
        return 0
    }
    return 1
}