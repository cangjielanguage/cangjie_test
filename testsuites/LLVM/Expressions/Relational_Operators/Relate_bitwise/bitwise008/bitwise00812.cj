// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 位操作符应用于tuple元素

func main(): Int64 {
    var tuple= (0, 10>>1,"5")
    var res2 = !(tuple[1])>>1
    if (res2 == -3) {
        return 0
    }
    return 1
}
