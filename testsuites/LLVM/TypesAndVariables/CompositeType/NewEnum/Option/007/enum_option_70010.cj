// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 1
    if (a is ?Int64) {
        return 1
    }
    return 0
}