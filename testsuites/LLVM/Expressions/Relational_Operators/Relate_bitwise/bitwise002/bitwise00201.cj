// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 0
    var c:Int8 = 20
    var d:Int8 = 0
    var e:Int8 = 5
    var z:Int8 = 1
    b = a << z
    if (b != c) {
        return 1
    }
    d = a >> z
    if (d != e) {
        return 1
    }
    return 0 
}