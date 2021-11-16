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

func getResultParse<T>(f: (String)-> Option<T>, arg: String, default: T): T{
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

func main(): Int64 {
    var res1 = getResultParse<Float64>(parseFloat64, "0b10", 0.0)
    var res2 = getResultParse<Float64>(parseFloat64, "0o20", 0.0)
    var res3 = getResultParse<Float64>(parseFloat64, "0x40", 0.0)
    if (res1 == 0.0 && res2 == 0.0 && res3 == 0.0) {
        return 0
    }
    return 1
}