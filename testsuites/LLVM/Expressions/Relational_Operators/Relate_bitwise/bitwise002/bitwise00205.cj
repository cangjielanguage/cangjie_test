// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// DTS202005210ELJBBP1300
func main(): Int64 {
    var a:Int64 = -2147483648
    var b:Int64 = 0
    var c:Int64 = -8796093022208
    var d:Int64 = 1
    var e:Int64 = -1073741824
    var r:Int64 = 12
    b = a << r
    if (b != c) {
        return 1
    }
    d = a >> d
    if (d != e) {
        return 1
    }
    return 0 
}