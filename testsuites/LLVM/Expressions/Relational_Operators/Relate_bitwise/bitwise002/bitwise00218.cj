// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int32 = 100
    var b:Int32 = 0
    var c:Int32 = 102400
    var d:Int32 = 0
    var r:Int32 = 10
    b = a << r
    if (b != c) {
        return 1
    }
    d = c >> r
    if (d != a) {
        return 1
    }
    return 0 
}