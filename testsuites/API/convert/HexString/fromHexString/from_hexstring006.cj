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
    var str = "63616e676a6965"
    var opt1 = fromHexString("63616e676a6965")
    var opt2 = fromHexString(str)
    var res1 = matchResult<Array<UInt8>>(opt1, Array<UInt8>())
    var res2 = matchResult<Array<UInt8>>(opt2, Array<UInt8>())


    if (res1[0] == 99 && res1[2] == 110 && res2[res2.size()-1] == 101) {
        return 0
    }
    return 1
}