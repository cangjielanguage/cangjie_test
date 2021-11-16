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
    var opt1 = fromHexString("cangjie")
    var opt2 = fromHexString("6h")
    var opt3 = fromHexString("2n")
    var res1 = matchResult<Array<UInt8>>(opt1, Array<UInt8>())
    var res2 = matchResult<Array<UInt8>>(opt2, Array<UInt8>())
    var res3 = matchResult<Array<UInt8>>(opt3, Array<UInt8>())
    if (res1.size() == 0 && res2.size() == 0 && res3.size() == 0) {
        return 0
    }
    return 1
}