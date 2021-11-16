// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import format.*

func main():Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_

    var flags =  '-'
    var width =  20
    var precision = 8
    var special = 'g'
    var res1 = a.format("${flags}${width}.${precision}${special}")
    var res2 = a.format("${flags}${width}.${precision}e")

    if (res1 != "-0.34008789         ") {
        return 1
    }
    if (res2 != "-3.40087891e-01     ") {
        return 2
    }

    return 0

}