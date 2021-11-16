// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt32 = 4294967295
    var b = chr(a)
    var c = ord(b)
    if (a != c) {
        return 1
    }
    return 0
}
