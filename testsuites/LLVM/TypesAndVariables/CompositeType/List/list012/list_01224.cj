// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// *解构map函数，map暂未实现
func main(): Int64 {
    let list12 = [1, 2, 3, *(map<Int64, Int64>([0, 1, 2, 3, 4], {x => x + 4}))]
    print(list12) // output: [1, 2, 3, 4, 5, 6, 7, 8]

    let list13 = [1, 2, 3, *(map<Int64, Int64>([10, 20, 30], {x => x / 10}))]
    print(list13)
    if (a == 8) {
        return 0
    }
    return 1
}
