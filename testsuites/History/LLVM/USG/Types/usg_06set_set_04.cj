// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var set: Set<Int64> = #{1, 2, 3}
    if ( set.size() != 3 ) {
        return 1
    }
    return 0
}