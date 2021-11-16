// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = -11
    if (b != !a) {
        return 1
    }
    return 0 
}