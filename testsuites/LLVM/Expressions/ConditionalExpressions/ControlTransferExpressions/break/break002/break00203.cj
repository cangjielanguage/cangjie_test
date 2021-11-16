// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int32 = 0
    while (i != 10) {
        i ++
        break
    }
    if (i == 1) {
        return 0
    }
    return 1
}
