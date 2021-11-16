// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 多重引用解析listExpr
class A<T> {
    var a: T
    init(x: T){
        a = x
    }
}

func main(): Int64 {
    var a = [A<List<Int64>>([1,2]), A<List<Int64>>([3,4])]
    var b = [1, 2, *a[1].a]
    if (b[3] == 4) {
        return 0
    }
    return 1
}
