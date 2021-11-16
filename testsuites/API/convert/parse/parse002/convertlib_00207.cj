// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import convert.*

func getResultParse<T>(f: (String)-> Option<T>, arg: String, default: T): T{
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case $None => default
    }
    return result
}

func main():Int64 {
    var str = #"1.23"#
    var parse8 = parseInt8(str)
    var res1 = matchResult<Int8>(parse8, 0)
    var res2 = getResultParse<UInt64>(parseUInt64, "-3.1415926", 0)
    var res3 = getResultParse<UInt32>(parseUInt32, "3.1415926", 0)
    var res4 = getResultParse<Float64>(parseFloat64, "789456123", 0.0)
    var res5 = getResultParse<Float64>(parseFloat64, "\n", 0.0)

    if (res1 ==0 && res2 ==0 && res3 ==0 && res4 == 0.0) {
        return 0
    }
    return 1
}