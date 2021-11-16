// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int32 = 10
    var b:Int32 = 10240
    if (a != b >> a) {
        return 1
    }
    return 0 
}