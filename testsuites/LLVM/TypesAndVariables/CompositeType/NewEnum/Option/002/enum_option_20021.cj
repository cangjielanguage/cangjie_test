// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var x : List<Int64> = [1]
    var i : ?Int64 = x[0]
    return 0
}
