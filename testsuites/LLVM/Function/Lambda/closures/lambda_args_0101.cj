// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a1: (Int32, Int32) -> Int32 = {a, b => a + b}
var a2: (Int32, Int32) -> Int32 = {a: Int32, b => a + b}
func main():Int64 {
    if ( a1(1,1) != 2 ) {
        return 1
    }
    if ( a2(1,1) != 2 ) {
        return 1
    }
    return 0
}

