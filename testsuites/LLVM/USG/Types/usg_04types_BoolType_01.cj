// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a:Bool = true
    let b:Bool = false
    if ( !a ) {
        return 1
    }
    if ( b ) {
        return 1
    }
    0
}
