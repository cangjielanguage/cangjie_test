// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( {x:Int32=> x + 1}(1) != 2 ) {
        return 1
    }
    return 0
}
