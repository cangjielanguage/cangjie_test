// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var li = [1, 2, 3]
    var li2 = ["1", "2", "3"]

    if ( li[0] != 1 ) {
        return 1
    }
    if ( li2[0] != "1" ) {
        return 1
    }
    return 0
}