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


func main(): Int64 {
    var str = "126"
    var a = parseInt8("-50")
    var b = parseInt16(str)
    var c = parseInt32("-3____2_")
    var d = parseInt64("-_6_4_")
    var e = parseUInt8("_2_5_4")
    var f = parseUInt16("16_")
    var g = parseUInt32("43_")
    var h = parseUInt64("--64_")
    var i = parseFloat16("-3_.1_24_46_46")
    var j = parseFloat32("-.35_45464")
    var k = parseFloat64("-1_24.22___14___")
    var res1 = matchResult<Int8>(a, 0)
    var res2 = matchResult<Int16>(b, 0)
    var res3 = matchResult<Int32>(c, 0)
    var res4 = matchResult<Int64>(d, 0)
    var res5 = matchResult<UInt8>(e, 0)
    var res6 = matchResult<UInt16>(f, 0)
    var res7 = matchResult<UInt32>(g, 0)
    var res8 = matchResult<UInt64>(h, 0)
    var res9 = matchResult<Float16>(i, 0.0)
    var res10 = matchResult<Float32>(j, 0.0)
    var res11 = matchResult<Float64>(k, 0.0)

    if (res1 != -50) {
        return 1
    }
    if (res2 != 126) {
        return 2
    }
    if (res3 != -32) {
        return 3
    }
    if (res4 != -64) {
        return 4
    }
    if (res5 != 254) {
        return 5
    }
    if (res6 != 16) {
        return 6
    }
    if (res7 != 43) {
        return 7
    }
    if (res8 != 0) {
        return 8
    }
    if (res9 != -3_.1_24_46_46) {
        return 9
    }
    if (res10 != -0.35_45464) {
        return 10
    }
    if (res11 != -1_24.22___14___) {
        return 11
    }
    return 0
}