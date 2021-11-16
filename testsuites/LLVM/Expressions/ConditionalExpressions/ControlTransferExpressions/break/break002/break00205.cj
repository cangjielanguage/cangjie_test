// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int32 = 0
    var j : Int32 = 0
    while (i != 10) {
        i ++
        while (j!=10) {
            break
            j ++
        }
    }
    if (j != 0) {
        return 1
    }
    if (i != 10) {
        return 2
    }
    return 0
}
