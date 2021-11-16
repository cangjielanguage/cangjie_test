// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int32 = 10
    var b:Int32 = -2147483648
    var c:Int32 = 0
    var d:Int32 = 0
    d = a & b
    if (d != c) {
        return 1
    }
    d = b & c
    if (d != c) {
        return 1
    }
    return 0 
}