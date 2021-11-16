// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l = 0..10
    var r = 0..5
    var temp = r
    l = temp
    if (l != r) {
        return 1
    }
    if (l == r) {
        return 0
    }
    return 1
}
