// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var (a,(b,c)) = (1,(2,'a'))
    if ( a != 1 ) {
        return 1
    }
    if ( b != 2 ) {
        return 1
    }
    if ( c != 'a' ) {
        return 1
    }
    return 0
}
