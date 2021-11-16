// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// hex
func main(): Int64 {
    var a:Int16 = 10
    var b:Int16 = 0xa8b
    var c:Int16 = 0
    var d:Int16 = 0
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