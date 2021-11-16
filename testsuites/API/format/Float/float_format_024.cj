// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import format.*

func main():Int64 {
    var a: Float16 = -0.3______4
    var b: Float32 = .3_____4
    var c: Float64 = 3____04_____546__46___________56_5.3__4_


    var res1 = a.format("-10.40g")
    var res2 = c.format("+50.40e")
    var res3 = c.format("50.40g")

    if (res1 != "-0.340087890625") {
        return 1
    }
    if (res2 != "   +3.0454646565340000152587890625000000000000e+10") {
        return 2
    }
    if (res3 != "                    30454646565.340000152587890625") {
        return 3
    }

    return 0

}