// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : UInt64 = 0
    var r : UInt64 = 1
    var temp = r
    l = temp
    if (l == r) {
        return 0
    }
    return 1
}
