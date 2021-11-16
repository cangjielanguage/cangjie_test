// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 多重引用解析listExpr
interface I{
    let list: List<Int64> = [1,2,3]
}

func main(): Int64 {
    var a = [1, 2, *I.list]
    if a.get(4) == 3{
        return 0
    }
    return 1
}
