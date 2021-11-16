// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Float32 = 1.0009765625000976562511
    var b:Float32 = 1.0009765625000976562511
    if (a-b>0.0001) {
        return 1
    }
    return 0
}