// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int8 = 127
    var b:Int8 = 0
    var c:Int8 = -128
    b = !a
    if (b != c) {
        return 1
    }
    return 0 
}