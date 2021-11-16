// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// * 后正向极值
func main():Int64 {
    var s1 = "仓颉" * 10
    if (s1 == "仓颉" * 10) {
        return 0
    }
    return 1
}
