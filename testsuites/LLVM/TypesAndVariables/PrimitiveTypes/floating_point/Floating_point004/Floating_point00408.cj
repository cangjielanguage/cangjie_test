// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Float64 = 0.0
    var b:Float64 = 0.0
    if (a-b>0.0001) {
        return 1
    }
    return 0
}