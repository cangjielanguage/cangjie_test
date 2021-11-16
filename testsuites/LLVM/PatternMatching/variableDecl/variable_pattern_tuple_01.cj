// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var (a,b):Int32*Char=(1,'a')
    if ( a != 1 ) {
        return 1
    }
    if ( b != 'a' ) {
        return 2
    }
    return 0
}
