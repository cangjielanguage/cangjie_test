// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// hex not support
func main(): Int64 {
    var a:Int16 = 10
    var b:Int16 = 0xa8b
    var c:Int16 = 0
    var d:Int16 = 0
    var e:Int16 = 2689
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