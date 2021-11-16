// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 位操作符应用于函数返回值
func foo(): Int64{
    var a: Int64 = 1
    var b: Int64 = 10
    return !(b>>a)>>a
}

func main(): Int64 {
    var res = foo()
    if (res == -3) {
        return 0
    }
    return 1
}