// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import format.*


func main():Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_

    var res1 = a.format("+")
    var res2 = b.format("+")
    var res3 = c.format("+")

    if (res1 != "-0.340088") {
        return 1
    }
    if (res2 != "+0.340000") {
        return 2
    }
    if (res3 != "+30.340000") {
        return 3
    }

    return 0

}