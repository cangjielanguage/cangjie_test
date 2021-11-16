// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// spec示例转化

func main(): Int64 {
    var emptyList : List<Int64> = []
    let list0 = [1, 2, 3, *emptyList, 3, 2, 1]
    let list1 = [4, 5, 6]
    let list2 = [1, 2, 3, *list1, 3, 2, 1]
    if (list0.size() == 6 && list2[4] == 5) {
        return 0
    }
    return 1
}
