// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var Day(_):TimeUnit = TimeUnit.Day(1)
    return 0
}

enum TimeUnit{
    Day(Int32)
}