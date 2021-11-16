// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 15
    var c:Int8 = 0
    var d:Int8 = 0
    var e:Int8 = 5
    d = a | b
    if (d != b) {
        return 1
    }
    d = c | b
    if (d != b) {
        return 1
    }
    return 0 
}