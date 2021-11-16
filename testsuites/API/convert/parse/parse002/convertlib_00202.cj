// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
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
    var str1 = "-129"
    var parse8 = parseInt8(str1)
    var parse8_1 = parseInt8("128")

    var res1 = matchResult<Int8>(parse8, 0)
    var res1_1 = matchResult<Int8>(parse8_1, 0)
    var res2 = getResultParse<Int16>(parseInt16, "0b1000000000000001", 0)
    var res2_1 = getResultParse<Int16>(parseInt16, "-32769", 0)
    var res3 = getResultParse<Int32>(parseInt32, "-2147483649", 0)
    var res3_1 = getResultParse<Int32>(parseInt32, "2147483648", 0)
    var res4 = getResultParse<Int64>(parseInt64, "-9223372036854775809", 0)
    var res4_1 = getResultParse<Int64>(parseInt64, "0x8000000000000000", 0)
    var res5 = getResultParse<UInt8>(parseUInt8, "257", 0)
    var res5_1 = getResultParse<UInt8>(parseUInt8, "-1", 0)
    var res6 = getResultParse<UInt16>(parseUInt16, "0o200000", 0)
    var res6_1 = getResultParse<UInt16>(parseUInt16, "-1", 0)
    var res7 = getResultParse<UInt32>(parseUInt32, "4294967296", 0)
    var res7_1 = getResultParse<UInt32>(parseUInt32, "-1", 0)
    var res8 = getResultParse<UInt64>(parseUInt64, "18446744073709551616", 0)
    var res8_1 = getResultParse<UInt64>(parseUInt64, "-1", 0)
    var res9 = getResultParse<Float16>(parseFloat16, "-65505", 0.0)
    var res9_2 = getResultParse<Float16>(parseFloat16, "65505", 0.0)
    var res10 = getResultParse<Float32>(parseFloat32, "-3.4e39", 0.0)
    var res10_2 = getResultParse<Float32>(parseFloat32, "3.4e39", 0.0)
    var res11 = getResultParse<Float64>(parseFloat64, "-2.5e308", 0.0)
    var res11_1 = getResultParse<Float64>(parseFloat64, "2.24e-307,", 0.0)
    var res11_2 = getResultParse<Float64>(parseFloat64, "1.8e309", 0.0)

    if (res1 != 0) {
        return 1
    }
    if (res1_1 != 0) {
        return 2
    }
    if (res2 != 0) {
        return 3
    }
    if (res2_1 != 0) {
        return 4
    }
    if (res3 != 0) {
        return 5
    }
    if (res3_1 != 0) {
        return 6
    }
    if (res4 != 0) {
        return 7
    }
    if (res4_1 != 0) {
        return 8
    }
    if (res5 != 0) {
        return 9
    }
    if (res5_1 != 0) {
        return 10
    }
    if (res6 != 0) {
        return 11
    }
    if (res6_1 != 0) {
        return 12
    }
    if (res7 != 0) {
        return 13
    }
    if (res7_1 != 0) {
        return 14
    }
    if (res8 != 0) {
        return 15
    }
    if (res8_1 != 0) {
        return 16
    }
    if (res9 != 0.0) {
        return 17
    }
    if (res9_2 != 0.0) {
        return 18
    }
    if (res10 != 0.0) {
        return 19
    }
    if (res10_2 != .0) {
        return 20
    }
    if (res11 != 0.0) {
        return 21
    }
    if (res11_1 != 0.0) {
        return 22
    }
    if (res11_2 != 0.0) {
        return 23
    }
    return 0
}