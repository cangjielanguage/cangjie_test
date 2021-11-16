// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): IntNative {
    var li: List<List<IntNative>> = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]
    if ( li[0][0] != 1) {
        return 1
    }
    if ( li[1][1] != 2) {
        return 1
    }
    if ( li[2][2] != 3) {
        return 1
    }
    return 0
}