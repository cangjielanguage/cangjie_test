// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:UInt8 = 127
    var b:UInt8 = 0
    var c:UInt8 = 254
    var d:UInt8 = 0
    var e:UInt8 = 63
    var r:UInt8 = 1
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