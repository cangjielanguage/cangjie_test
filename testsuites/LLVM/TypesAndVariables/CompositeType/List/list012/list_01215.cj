// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 逐步解析多层listExpr
open class A<T> {
    var a: T
    init(x: T){
        a = x
    }
}

func main(): Int64 {
    var a = [A<List<Int64>>([1,2]), A<List<Int64>>([3,4])]
    var b = [4,5,6]
    var c = [*[1, 2, *a[1].a], *b]
    if (c[2] == 3 && c[c.size()-1] == 6) {
        return 0
    }
    return 1
}
