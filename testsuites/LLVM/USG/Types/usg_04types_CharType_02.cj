// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let slash:Char = '\''
    let nextLine:Char = '\n'
    let doubleSlash:Char = '\"'
    if ( slash != '\'' ) {
        return 1
    }
    if ( nextLine != '\n' ) {
        return 1
    }
    if ( doubleSlash != '\"' ) {
        return 1
    }
    0
}
