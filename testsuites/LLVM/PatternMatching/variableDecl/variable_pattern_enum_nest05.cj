// EXEC-PIPE-1: %compiler %cmp_opt %f  -o %output 2>&1 | compare %f

func main() : Int64 {
    var Day(a:Int32):TimeUnit = TimeUnit.Day(1) // EXPECTED: regex error.*the pattern isn't irrefutable pattern and it can not be initialized
    if ( a != 1) {
        return 1
    }
    return 0
}

enum TimeUnit{
    Day(Int32)
}