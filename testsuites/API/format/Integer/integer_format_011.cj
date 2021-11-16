// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import format.*

func main():Int64 {
    var a: UInt32 = 20
    var b: Int64 = -20
    var c = 0
    var d = -0

    var res1 = a.format("10")
    var res2= b.format("10")
    var res3= c.format("10")
    var res4= d.format("10")


    if (res1 != "        20") {
        return 1
    }
    if (res2 != "       -20") {
        return 2
    }
    if (res3 != "         0") {
        return 3
    }
    if (res4 != "         0") {
        return 4
    }

    return 0

}