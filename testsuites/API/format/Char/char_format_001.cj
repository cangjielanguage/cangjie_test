// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import format.*

func main():Int64 {
    var a: Char = 'a'
    var b = '-'
    var c = '\n'
    var d = '\b'

    var res1 = a.format("-10")  // left  align
    var res2 = b.format("10")  // right align
    var res3 = c.format("10")  // right align
    var res4 = c.format("-")  // left align
    var res5 = d.format("-")  // left align

    if (res1 != "a         ") {
        return 1
    }
    if (res2 != "         -") {
        return 2
    }
    if (res3 != "         \n") {
        return 3
    }
    if (res4 != "\n") {
        return 4
    }
    if (res5 != "\b") {
        return 5
    }
    return 0
}