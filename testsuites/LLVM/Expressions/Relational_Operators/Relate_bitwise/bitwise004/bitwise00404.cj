// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// 幂不支持
func main(): Int64 {
    var a:UInt32 = 10
    var b:UInt32 = 2**31-1
    var c:UInt32 = 0
    var d:UInt32 = 0
    var e:UInt32 = 2147483637
    d = a ^ b
    if (d != e) {
        return 1
    }
    d = c ^ b
    if (d != b) {
        return 1
    }
    return 0 
}