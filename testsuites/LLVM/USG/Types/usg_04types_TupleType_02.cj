// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var pi = (3.14, "PIE")

    if ( pi[0] != 3.14 ) {
        return 1
    }
    if ( pi[1] != "PIE" ) {
        return 1
    }
    return 0
}
