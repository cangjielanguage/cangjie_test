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
    var str1 = "-128"
    var parse8 = parseInt8(str1)
    var parse8_1 = parseInt8("127")

    var res1 = matchResult<Int8>(parse8, 0)
    var res1_1 = matchResult<Int8>(parse8_1, 0)
    var res2 = getResultParse<Int16>(parseInt16, "32767", 0)
    var res2_1 = getResultParse<Int16>(parseInt16, "-32768", 0)
    var res3 = getResultParse<Int32>(parseInt32, "-2147483648", 0)
    var res3_1 = getResultParse<Int32>(parseInt32, "2147483647", 0)
    var res4 = getResultParse<Int64>(parseInt64, "-9223372036854775808", 0)
    var res4_1 = getResultParse<Int64>(parseInt64, "9223372036854775807", 0)
    var res5 = getResultParse<UInt8>(parseUInt8, "255", 0)
    var res5_1 = getResultParse<UInt8>(parseUInt8, "0", 0)
    var res6 = getResultParse<UInt16>(parseUInt16, "65535", 0)
    var res6_1 = getResultParse<UInt16>(parseUInt16, "0", 0)
    var res7 = getResultParse<UInt32>(parseUInt32, "4294967295", 0)
    var res7_1 = getResultParse<UInt32>(parseUInt32, "0", 0)
    var res8 = getResultParse<UInt64>(parseUInt64, "18446744073709551615", 0)
    var res8_1 = getResultParse<UInt64>(parseUInt64, "0", 0)

    if (res1 != -128) {
        return 1
    }
    if (res1_1 != 127) {
        return 1
    }
    if (res2 != 32767) {
        return 1
    }
    if (res2_1 != -32768) {
        return 1
    }
    if (res3 != -2147483648) {
        return 1
    }
    if (res3_1 != 2147483647) {
        return 1
    }
    if (res4 != -9223372036854775808) {
        return 1
    }
    if (res4_1 != 9223372036854775807) {
        return 1
    }
    if (res5 != 255) {
        return 1
    }
    if (res5_1 != 0) {
        return 1
    }
    if (res6 != 65535) {
        return 1
    }
    if (res6_1 != 0) {
        return 1
    }
    if (res7 != 4294967295) {
        return 1
    }
    if (res7_1 != 0) {
        return 1
    }
    if (res8 != 18446744073709551615) {
        return 1
    }
    if (res8_1 != 0) {
        return 1
    }

    return 0
}