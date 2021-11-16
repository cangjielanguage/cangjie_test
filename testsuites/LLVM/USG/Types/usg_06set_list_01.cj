// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var li = List<Int64>([1,2,3])
    li = List<Int64>(ArrayList<Int64>([666]))

    for (i in li) {
        if ( li[0] != 666 ) {
            return 1
        }
    }
    return 0
}