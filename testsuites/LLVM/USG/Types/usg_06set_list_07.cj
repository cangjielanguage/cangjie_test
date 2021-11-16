// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var li = [1, 2, 3]
    var li2 = [1, *li, *[3, 2, 1]] // li2 = [1, 1, 2, 3, 3, 2, 1]
    if (  li2[3] != 3 ) {
        return 1
    }
    return 0
}