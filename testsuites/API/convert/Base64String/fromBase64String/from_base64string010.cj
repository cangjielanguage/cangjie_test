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
    var a = "Q2FuZ2ppZQ=="
    var opt = fromBase64String("${a}")
    var res = matchResult<Array<UInt8>>(opt, Array<UInt8>())

    if (res[0] == 67 && res[res.size()-1] == 101) {
        return 0
    }
    return 1
}