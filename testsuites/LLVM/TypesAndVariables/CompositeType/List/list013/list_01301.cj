// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// spec示例转化

func main(): Int64 {
    let emptyList : List<Int64> = []
    let list0 = [1, 2, 3, 3, 2, 1]
    let list1 = [1 + 3, 2 + 3, 3 + 3]
    if (emptyList.size() ==0 && 1 == list0[list0.size()-1] && list1[0] == 4) {
        return 0
    }
    return 1
}
