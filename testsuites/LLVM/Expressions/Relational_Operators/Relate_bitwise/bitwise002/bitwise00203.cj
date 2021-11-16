// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// DTS202005210ELJBBP1300
func main(): Int64 {
    var a:Int32 = -32768
    var b:Int32 = 0
    var c:Int32 = -33554432
    var d:Int32 = 0
    var e:Int32 = -32
    var r:Int32 = 10
    b = a << r
    if (b != c) {
        return 1
    }
    b = a >> r
    if (b != e) {
        return 3
    }
    return 0
}