// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 127
    var c:Int8 = 0
    var d:Int8 = 0
    d = a & b
    if (d != a) {
        return 1
    }
    d = b & c
    if (d != c) {
        return 1
    }
    return 0 
}