// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    //var a:Int32 = 2**31-1 本意是要测这个
    var a:UInt32 = 2147483647
    var b:UInt32 = 0
    var c:UInt32 = 4294967294
    var d:UInt32 = 0
    var e:UInt32 = 1073741823
    var r:UInt32 = 1
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