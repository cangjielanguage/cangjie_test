// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int64 = 10
    var b:Int64 = 2
    var c:Int64 = 0
    var d:Int64 = 0
    var e:Int64 = 3
    c = a<<e>>b
    d = a<<(e>>b)
    if (c != 20) {
        return c
    }
    if (d != 10) {
        return d
    }
    return 0
}
