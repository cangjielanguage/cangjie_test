// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import convert.*

func main():Int64 {
    var a:UInt8 = 255
    try {
        var res1 = toBase64String(Array<UInt8>([a+1]))
    } catch (_: OverflowException) {
        return 0
    }
    return 1
}