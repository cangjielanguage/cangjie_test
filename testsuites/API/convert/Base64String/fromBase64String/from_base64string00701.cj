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
    var str1 = "Mi4xLjEuMSBO"
    var opt1 = fromBase64String(str1)
    var res2 = matchResult<Array<UInt8>>(opt1, Array<UInt8>())
    if (res2[0] == 50 && res2[1] == 46 && res2[2] == 49 && res2[3] == 46) {
        return 0
    }
    return 1
}