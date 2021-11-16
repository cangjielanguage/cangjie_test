// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
//十六进制可能不支持
func main(): Int64 {
    var a:Int32 = 0xa8b
    var b:Int32 = 0
    var c:Int32 = 86368
    var d:Int32 = 0
    var e:Int32 = 84
    var r:Int32 = 5
    b = a << r
    if (b != c) {
        return 1
    }
    d = a >> r
    if (d != e) {
        return 1
    }
    return 0
}
