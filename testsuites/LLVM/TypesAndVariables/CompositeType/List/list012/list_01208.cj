// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 多重引用解析listExpr
func foo(x:List<Int64>):List<Int64>{
    return x
}

func main(): Int64 {
    var a = [4,5,6]
    var b = [1, 2, *foo(a)]
    if (b[3] == 5) {
        return 0
    }
    return 1
}
