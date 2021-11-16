// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// DTS202005210ELJBBP1300
func main(): Int64 {
    var a:Int64 = -9223372036854775808
    var b:Int64 = 0
//  var c:Int64 = -18446744073709551616
    var d:Int64= 0
    var e:Int64 = -4611686018427387904
//  b = a << 1
//  if (b != c) {
//      return 1
//  }
    d = a >> 1
    if (d != e) {
        return 1
    }
    return 0
}
