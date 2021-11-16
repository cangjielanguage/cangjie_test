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


func main(): Int64 {
    var str1 = "a_123456"
    var parse8 = parseInt8(str1)
    var parse8_1 = parseInt8("h456o")

    var res1 = matchResult<Int8>(parse8, 0)
    var res2 = getResultParse<Int16>(parseInt16, "\n123", 0)
    var res3 = getResultParse<Int32>(parseInt32, "1234abcsf56778", 0)
    var res4 = getResultParse<Int64>(parseInt64, "h123o", 0)
    var res5 = getResultParse<UInt8>(parseUInt8, "\r123", 0)
    var res6 = getResultParse<UInt16>(parseUInt16, "123o456", 0)
    var res7 = getResultParse<UInt32>(parseUInt32, "w467d", 0)
    var res8 = getResultParse<UInt64>(parseUInt64, "1234,", 0)
    var res9 = getResultParse<Float16>(parseFloat16, "#$%$1234", 0.0)
    var res10 = getResultParse<Float32>(parseFloat32, "\r\t\n23454", 0.0)
    var res11 = getResultParse<Float64>(parseFloat64, "\u{5}35454", 0.0)

    if (res1 == 0 && res2 == 0 && res3 == 0 && res4 == 0 && res5 == 0 && res6 == 0 && res7 == 0 && res8 == 0 && res9 == 0.0 && res10 == 0.0 && res11 == 0.0) {
        return 0
    }

    return 1
}