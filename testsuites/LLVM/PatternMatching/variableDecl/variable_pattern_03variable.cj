// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a = 1
    if ( a != 1 ) {
        return 1
    }
    return 0
}
