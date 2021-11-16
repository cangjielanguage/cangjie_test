// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Float32 = 1.00097656254500097656251111
    var b:Float32 = 1.00097656254500097656251111
    if (a-b>0.0001) {
        return 1
    }
    return 0
}