// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 条件表达式实现条件初始化
func main(): Int64 {
    let list11 = [1, 2, 3, *(if (1<2) {[4, 5]} else {[6, 7]})]
    if (list11[3] == 4) {
        return 0
    }
    return 1
}
