// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var Day(Month(a)):TimeUnit = TimeUnit.Day(Month(1))
    if ( a != 1) {
        return 1
    }
    return 0
}

enum TimeUnit{
    Day(TimeUnit2)
}
enum TimeUnit2{
    Month(Int32)
}