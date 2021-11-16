// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : Float32 = 0.0
    var r : Float32 = 1.0
    var temp = r
    l = temp
    if (l == r) {
        return 0
    }
    return 1
}
