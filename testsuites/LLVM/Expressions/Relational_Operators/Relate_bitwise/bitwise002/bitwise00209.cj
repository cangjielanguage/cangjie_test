// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
//failure cause: octal num is not supported for now
func main(): Int64 {
    var a:Int8 = 0o30
    var b:Int8 = 0
    var c:Int8 = 96
    var d:Int8 = 0
    var e:Int8 = 12
    b = a << 2
    if (b != c) {
        return 1
    }
    d = a >> 1
    if (d != e) {
        return 1
    }
    return 0
}
