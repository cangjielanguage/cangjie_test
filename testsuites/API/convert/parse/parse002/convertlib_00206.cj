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
    var str1 = "-0A200"
    var parse8 = parseInt8(str1)
    var parse8_1 = parseInt8("0C1111111")

    var res1 = matchResult<Int8>(parse8, 0)
    var res1_1 = matchResult<Int8>(parse8_1, 0)
    var res2 = getResultParse<Int16>(parseInt16, "0V111111111111111", 0)
    var res2_1 = getResultParse<Int16>(parseInt16, "-0G8000", 0)
    var res3 = getResultParse<Int32>(parseInt32, "-oD80000000", 0)
    var res3_1 = getResultParse<Int32>(parseInt32, """
0E17777777777
    """, 0)
    var res4 = getResultParse<Int64>(parseInt64, "-0bE1000000000000000000000000000000000000000000000000000000000000000", 0)
    var res4_1 = getResultParse<Int64>(parseInt64, "0xB7fffffffffffffff", 0)
    var res5 = getResultParse<UInt8>(parseUInt8, "0oX377", 0)
    var res5_1 = getResultParse<UInt8>(parseUInt8, "0xX0", 0)
    var res6 = getResultParse<UInt16>(parseUInt16, "xb5535", 0)
    var res6_1 = getResultParse<UInt16>(parseUInt16, "0oO0", 0)
    var res7 = getResultParse<UInt32>(parseUInt32, "OB4294967295", 0)
    var res7_1 = getResultParse<UInt32>(parseUInt32, "0b0", 0)
    var res8 = getResultParse<UInt64>(parseUInt64, "xb18446744073709551615", 0)
    var res8_1 = getResultParse<UInt64>(parseUInt64, "0BX0", 0)
    var res9 = getResultParse<Float16>(parseFloat16, "-0OM177740", 0.0)
    var res9_1 = getResultParse<Float16>(parseFloat16, "0B6.104e-5", 0.0)
    var res9_2 = getResultParse<Float16>(parseFloat16, "0MXffe0", 0.0)
    var res10 = getResultParse<Float32>(parseFloat32, "-j3.4e38", 0.0)
    var res10_1 = getResultParse<Float32>(parseFloat32, "X1.18e-38", 0.0)
    var res10_2 = getResultParse<Float32>(parseFloat32, "0h3.4e38", 0.0)
    var res11 = getResultParse<Float64>(parseFloat64, "-0h1.8e30", 0.0)
    var res11_1 = getResultParse<Float64>(parseFloat64, "0n.23e-308,", 0.0)
    var res11_2 = getResultParse<Float64>(parseFloat64, "0m1.8e308", 0.0)
    if (res1 != 0) {
        return 1
    }
    if (res1_1 != 0) {
        return 1
    }
    if (res2 != 0) {
        return 1
    }
    if (res2_1 != 0) {
        return 1
    }
    if (res3 != 0) {
        return 1
    }
    if (res3_1 != 0) {
        return 1
    }
    if (res4 != 0) {
        return 1
    }
    if (res4_1 != 0) {
        return 1
    }
    if (res5 != 0) {
        return 1
    }
    if (res5_1 != 0) {
        return 1
    }
    if (res6 != 0) {
        return 1
    }
    if (res6_1 != 0) {
        return 1
    }
    if (res7 != 0) {
        return 1
    }
    if (res7_1 != 0) {
        return 1
    }
    if (res8 != 0) {
        return 1
    }
    if (res8_1 != 0) {
        return 1
    }
    if (res9 != 0.0) {
        return 1
    }
    if (res9_1 != 0.0) {
        return 1
    }
    if (res9_2 != 0.0) {
        return 1
    }
    if (res10 != 0.0) {
        return 1
    }
    if (res10_1 != 0.0) {
        return 1
    }
    if (res10_2 != .0) {
        return 1
    }
    if (res11 != 0.0) {
        return 1
    }
    if (res11_1 != 0.0) {
        return 1
    }
    if (res11_2 != 0.0) {
        return 1
    }
    return 0
}