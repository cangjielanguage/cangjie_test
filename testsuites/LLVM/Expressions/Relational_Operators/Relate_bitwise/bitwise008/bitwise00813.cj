// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 带下划线的数值，使用位操作符
func main(): Int64 {
    var x = !1_0_
    if (x == -11) {
        return 0
    }
    return 1
}