// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import format.*

func main():Int64 {
    var a: UInt32 = 20

    var flags =  '-'
    var width =  10
    var precision =  8
    var special = 'x'
    var res1 = a.format("${flags}${width}.${precision}${special}")
    var res2 = a.format("-10.8x")

    if (res1 == res2 && res1 == "00000014  ") {
        return 0
    }

    return 1

}