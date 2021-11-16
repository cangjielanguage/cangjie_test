// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
 from std import format.*


func main():Int64 {
    var a: Float16 = -3.1241
    var b: Float32 = .341
    var c: Float64 = 3_0.3__4_
    var d: Float64 = 0.0
    var e: Float64 = -0.0

    var res1 = a.format("020e")
    var res2 = a.format("010g")

    var res3 = b.format("020e")
    var res4 = b.format("05g")

    var res5 = c.format("020e")
    var res6 = d.format("05g")

    if (res1 != "-00000003.125000e+00") {
        return 1
    }
    if (res2 != "-00003.125") {
        return 2
    }
    if (res3 != "000000003.410000e-01") {
        return 3
    }

    if (res4 != "0.341") {
        return 4
    }
    if (res5 != "000000003.034000e+01") {
        return 5
    }
    if (res6 != "00000") {
        return 6
    }


    return 0

}