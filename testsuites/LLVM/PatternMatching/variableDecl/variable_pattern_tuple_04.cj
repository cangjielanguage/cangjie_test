// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var (a:Int32,b:Char)=(1,'a') // EXPECTED: regex error.*?the pattern isn't irrefutable pattern and it can not be initialized
    if ( a != 1 ) {
        return 1
    }
    if ( b != 'a' ) {
        return 2
    }
    return 0
}