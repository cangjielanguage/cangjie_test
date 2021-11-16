// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a:Char = 'a'
    if ( a != 'a' ) {
        return 1
    }
    0
}
