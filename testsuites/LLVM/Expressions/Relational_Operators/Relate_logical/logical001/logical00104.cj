// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int8 = 1
    if (!(a==a)) {
        return 1
    }
    return 0 
}