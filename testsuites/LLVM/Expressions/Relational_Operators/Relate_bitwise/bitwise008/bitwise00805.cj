// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 字面量直接调用位操作符
func main(): Int64 {
    var c:Int32 = 0
    var d:Int32 = 0
    c = 7|10^2
    d = 7|(10^2)
    if (c != d) {
        return 1
    }
    return 0 
}