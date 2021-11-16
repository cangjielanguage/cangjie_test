// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i : UInt8 = 4
    i++
    if (i != UInt8(5)) {
        return 1
    }
    i--
    if (i != UInt8(4)) {
        return 2
    }
    return 0
}
