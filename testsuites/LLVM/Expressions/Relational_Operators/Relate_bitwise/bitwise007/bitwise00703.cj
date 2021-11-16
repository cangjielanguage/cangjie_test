// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int8 = 7
    var b:Int8 = 2
    var c:Int8 = 0
    var d:Int8 = 0
    var e:Int8 = 10
    c = a&e>>b
    d = a&(e>>b)
    if (c != d) {
        return 1
    }
    return 0 
}