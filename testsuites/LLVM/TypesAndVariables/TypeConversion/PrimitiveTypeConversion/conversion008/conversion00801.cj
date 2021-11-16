// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt32 = 0
    var b = chr(a)
    var c = ord(b)
    return Int64(a)
}
