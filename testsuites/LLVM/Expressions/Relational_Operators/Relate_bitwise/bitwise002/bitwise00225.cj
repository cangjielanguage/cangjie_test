// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// hex is not supported for now
func main(): Int64 {
    var a:Int32 = 10
    var b:Int32 = 0
    var c:Int32 = 10240
    var d:Int32 = 0
    b = a << 0xa
    if (b != c) {
        return 1
    }
    d = c >> 0xa
    if (d != a) {
        return 1
    }
    return 0
}