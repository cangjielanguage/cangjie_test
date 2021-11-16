// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 自身变量调用操作符
func main(): Int64 {
    var a = 10
    a = !!!!a>>1
    if (a == 5) {
        return 0
    }
    return 1
}