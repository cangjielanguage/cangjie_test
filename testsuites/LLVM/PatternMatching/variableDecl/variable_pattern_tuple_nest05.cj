// EXEC-PIPE-1: %compiler %cmp_opt %f  -o %output 2>&1 | compare %f

func main() : Int64 {
    var (a:Int32,b:Int32) = (1,2) // EXPECTED: regex error.*the pattern isn't irrefutable pattern and it can not be initialized
    if ( a != 1 ) {
        return 1
    }
    if ( b != 2 ) {
        return 1
    }
    return 0
}