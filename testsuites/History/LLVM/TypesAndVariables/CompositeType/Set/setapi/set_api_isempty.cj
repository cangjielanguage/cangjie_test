 // EXEC: %compiler %cmp_opt %f -o %output
 // EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var set = Set<Int64>()
    if (set.isEmpty()) {
        return 0
    }
    return 1
}