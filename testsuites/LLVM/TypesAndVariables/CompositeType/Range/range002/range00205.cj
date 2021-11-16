// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var res = 0
    for (i in -10..10:1) {
        res = res + 1
    }
    if (res == 20) {
        return 0
    }
    return 1
}
