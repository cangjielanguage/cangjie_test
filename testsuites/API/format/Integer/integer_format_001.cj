// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import format.*

func main():Int64 {
    var a: Int32 = -20
    var res1 = a.format("-10")
    var res2 = a.format("+10")
    var res3 = (-20).format("10")
    var res4 = a.format("-")

    if (res1 != "-20       ") {
        return 1
    }
    if (res2 != "       -20") {
        return 2
    }
    if (res3 != "       -20") {
        return 3
    }
    if (res4 != "-20") {
        return 4
    }

    return 0

}