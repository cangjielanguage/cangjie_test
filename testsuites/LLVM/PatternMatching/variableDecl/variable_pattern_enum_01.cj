// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS202105240MZV5NP1H00
func main() : Int64 {
    var Day(a):TimeUnit = TimeUnit.Day(1)
    if ( a != 1) {
        return 1
    }
    return 0
}

enum TimeUnit{
    Day(Int32)
}