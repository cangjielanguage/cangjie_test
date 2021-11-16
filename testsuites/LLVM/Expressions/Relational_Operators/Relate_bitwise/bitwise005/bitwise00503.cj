// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int32 = 10
    var b:Int32 = -32768
    var c:Int32 = 0
    var d:Int32 = 0
    var e:Int32 = -32758
    d = a | b
    if (d != e) {
        return 1
    }
    d = c | b
    if (d != b) {
        return 1
    }
    return 0 
}