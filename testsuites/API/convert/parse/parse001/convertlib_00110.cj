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
    var str = """
1
2
3
"""
    var parse8 = parseInt8("""
1
2
3
""")
    var res1 = matchResult<Int8>(parse8, 0)
    var res2 = getResultParse<Int16>(parseInt16, str, 0)
    var res3 = getResultParse<Int32>(parseInt32, str, 0)
    var res4 = getResultParse<Int64>(parseInt64, str, 0)
    var res5 = getResultParse<UInt8>(parseUInt8, str, 0)
    var res6 = getResultParse<UInt16>(parseUInt16, str, 0)
    var res7 = getResultParse<UInt32>(parseUInt32, str, 0)
    var res8 = getResultParse<UInt64>(parseUInt64, str, 0)
    var res9 = getResultParse<Float16>(parseFloat16, str, 0.0)
    var res10 = getResultParse<Float32>(parseFloat32, str, 0.0)
    var res11 = getResultParse<Float64>(parseFloat64, str, 0.0)


    if (res1 == 0 && res2 == 0 && res3 == 0 && res4 == 0 && res5 == 0 && res6 == 0 && res7 == 0 && res8 == 0 && res9 == 0.0 && res10 == 0.0 && res11 == 0.0) {
        return 0
    }
    return 1
}