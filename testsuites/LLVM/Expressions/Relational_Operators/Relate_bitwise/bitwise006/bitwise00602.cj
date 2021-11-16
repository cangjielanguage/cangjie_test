// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int16 = 10
    var b:Int16 = 10240
    if (b != a << a) {
        return 1
    }
    return 0 
}