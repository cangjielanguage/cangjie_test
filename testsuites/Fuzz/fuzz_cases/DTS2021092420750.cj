// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// random seed:1632307992873

// All global variable need to be defined before use!
func main(): Int64 {
    var a = 1
    do {
        a = a + 1
        continue
    } while (false)
    if ( a == 2 ) {
        return 0
    }
    return 1;
}
