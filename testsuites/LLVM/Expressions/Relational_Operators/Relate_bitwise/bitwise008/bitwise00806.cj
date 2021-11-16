// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 字面量直接调用位操作符，优先级
func main(): Int64 {
    var c:Int64 = 0
    var d:Int64 = 28
    c = !!10<<1^8&15|24
    if (c != d) {
        return c
    }
    return 0 
}