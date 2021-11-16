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
    var str = ""
    var a = parseInt8("")
    var b = parseInt16(str)
    var c = parseInt32("")
    var d = parseInt64("")
    var e = parseUInt8("")
    var f = parseUInt16(" ")
    var g = parseUInt32("")
    var h = parseUInt64("")
    var i = parseFloat16("    ")
    var j = parseFloat32("")
    var k = parseFloat64("")
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
    if (res1 == 0 && res2 == 0 && res3 == 0 && res4 == 0 && res5 == 0 && res6 == 0 && res7 == 0 && res8 == 0 && res9 == 0.0 && res10 == 0.0 && res11 == 0.0) {
        return 0
    }

    return 1
}