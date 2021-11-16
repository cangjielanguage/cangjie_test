// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    if (false) {
        var i : Int32 = 0
    }
    else {
        return 0
    }
    return 1
}
