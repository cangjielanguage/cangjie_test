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
    var opt1 = fromBase64String("TW=")
    var opt2 = fromBase64String("UaTW3")
    var res1 = matchResult<Array<UInt8>>(opt1, Array<UInt8>([1]))
    var res2 = matchResult<Array<UInt8>>(opt2, Array<UInt8>([1]))
    if (res1.size() == 1 && res2.size() == 1 && res1[0] == 1 && res1[0] == 1) {
        return 0
    }
    return 1
}