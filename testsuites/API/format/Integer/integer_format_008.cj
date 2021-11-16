// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import format.*

func main():Int64 {
    var a: UInt32 = 4294967295
    var b: Int64 = -9223372036854775808

    var res1 = a.format("1")
    var res2= b.format("30")
    var res3 = a.format("30")
    var res4 = b.format("")


    if (res1 != "4294967295") {
        return 1
    }
    if (res2 != "          -9223372036854775808") {
        return 2
    }
    if (res3 != "                    4294967295") {
        return 3
    }
    if (res4 != "-9223372036854775808") {
        return 4
    }

    return 0

}