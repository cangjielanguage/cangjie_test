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
    var str1 = "true"
    var str2 = "false"
    var a = convert.parseBool("true")
    var b = parseBool(str1)
    var c = parseBool(str2)

    var res1 = matchResult<Bool>(a, false)
    var res2 = matchResult<Bool>(b, false)
    var res3 = matchResult<Bool>(c, true)

    if (res1 && res2 && !res3 ) {
        return 0
    }
    return 1
}