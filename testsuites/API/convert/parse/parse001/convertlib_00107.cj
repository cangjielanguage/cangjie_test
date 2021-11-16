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
    var str = "126"
    var a = convert.parseInt8("50")
    var b = parseInt16(str)
    var c = parseInt32("32")
    var d = parseInt64("64")
    var e = parseUInt8("254")
    var f = parseUInt16("16")
    var g = parseUInt32("43")
    var h = parseUInt64("64")
    var i = parseFloat16("3.1244_6_4_6")
    var j = parseFloat32(".3545464")
    var k = parseFloat64("124.2214")
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
    if (res1 == 50 && res2 == 126 && res3 == 32 && res4 == 64 && res5 == 254 && res6 == 16 && res7 == 43 && res8 == 64 && res9 == 3.1244646 && res10 == 0.3545464 && res11 == 124.2214) {
        return 0
    }
    return 1
}