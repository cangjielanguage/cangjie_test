// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// bigInt
func main(): Int64 {
    var a:UInt64 = 10
    var b:UInt64 = 9223372036854775808
    var c:UInt64 = 0
    var d:UInt64 = 0
    var e:UInt64 = 9223372036854775818
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