// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 位操作符应用于list索引/以及list元素

func main(): Int64 {
    var list: List<Int64> = [1,2,3,4,10>>1,6,7,8,9,10,11]
    var res1 = list[10>>1>>1]
    var res2 = !list[4]>>1
    if (res1 == 3 && res2 == -3) {
        return 0
    }
    return 1
}