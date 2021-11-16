// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var lit07 = 2.34567_89123424e-29
    if (lit07 == 2.34567_89123424e-29) {
        return 0
    }
    return 1
}
