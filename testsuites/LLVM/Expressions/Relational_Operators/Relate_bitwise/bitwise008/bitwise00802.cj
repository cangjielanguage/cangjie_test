// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 字面量直接调用操作符
func main(): Int64 {
    var c:Int64 = 0
    var d:Int64 = 0
    c = 10<<3>>2
    d = 10<<(3>>2)
    if (c != 20) {
        return c
    }
    if (d != 10) {
        return d
    }
    return 0
}
