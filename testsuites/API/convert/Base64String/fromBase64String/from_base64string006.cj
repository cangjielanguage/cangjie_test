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
    var str = "TWFu"
    var opt1 = fromBase64String("TWFu")
    var opt2 = fromBase64String(str)
    var res1 = matchResult<Array<UInt8>>(opt1, Array<UInt8>())
    var res2 = matchResult<Array<UInt8>>(opt2, Array<UInt8>())
    if (res1[0] == 77 && res2[1] == 97 && res1[2] == 110) {
        return 0
    }
    return 1
}