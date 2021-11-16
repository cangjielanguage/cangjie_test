// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Float32 = 3.4*10.0**38.0
    var b:Float32 = 3.4*10.0**38.0
    if (a-b>0.0001) {
        return 1
    }
    return 0
}