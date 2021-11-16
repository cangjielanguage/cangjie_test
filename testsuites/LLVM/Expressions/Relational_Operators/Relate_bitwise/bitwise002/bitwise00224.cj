// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// binary is not supported for now.
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 0
    var c:Int8 = 20
    var d:Int8 = 0
    b = a << 0b0001
    if (b != c) {
        return 1
    }
    d = c >> 0b0001
    if (d != a) {
        return 1
    }
    return 0 
}