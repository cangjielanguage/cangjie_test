// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import format.*

func main():Int64 {
    var a: UInt32 = 4294967295
    var b: Int64 = -9223372036854775808
    var c = 0
    var d = -0

    var flags =  '-'
    var width =  20
    var precision = 8
    var special = 'x'
    var res = a.format("${flags}${width}.${precision}${special}")


    if (res != "ffffffff            ") {
        return 1
    }

    return 0

}