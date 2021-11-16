// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : UInt16 = 0
    var r : UInt16 = 1
    var temp = r
    l = temp
    if (l == r) {
        return 0
    }
    return 1
}
