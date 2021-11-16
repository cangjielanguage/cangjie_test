// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int32 = 2147483647
    var b:Int32 = 0
    var c:Int32 = -2147483648
    b = !a
    if (b != c) {
        return 1
    }
    return 0 
}