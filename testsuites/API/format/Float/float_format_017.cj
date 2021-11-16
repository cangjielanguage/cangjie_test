// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import format.*

func main():Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_
    var d: Float64 = 0.0

    var flags =  '-'
    var width =  10
    var precision =  8
    var special = 'g'
    var res1 = a.format("${flags}${width}.${precision}${special}")
    var res2 = b.format("${flags}${width}.${precision}${special}")
    var res3 = c.format("${flags}${width}.${precision}${special}")
    var res4 = d.format("${flags}${width}.${precision}${special}")

    if (res1 != "-0.34008789") {
        return 1
    }
    if (res2 != "0.34      ") {
        return 2
    }
    if (res3 != "30.34     ") {
        return 3
    }
    if (res4 != "0         ") {
        return 4
    }

    return 0

}