// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// spec示例转化
func main(): Int64 {
    let list7 = [*[[1,2,3]]]
    let list8 = [*[[1,2,3]],[4,5],[6,7,8]]
    if (list7[0][0] == 1 && list8[0][2] == 3) {
        return 0
    }
    return 1
}
