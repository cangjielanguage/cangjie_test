// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// * 后为表达式
func main():Int64 {
    var s1 = "仓颉" * (2*2+1)
    if (s1 == "仓颉" * 5) {
        return 0
    }
    return 1
}
