// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let setOne: Set<Int32> = #{5, 6, 7, 5}
    return 0
}