// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 多重引用解析listExpr
enum E{
    Day(List<Int64>)
}

func main(): Int64 {
    var e = Day([1,2,*[3,4]])
    var res = match (e) {
        case Day(x) => [x[2],x[3]]
    }
    if (res[1] == 4) {
        return 0
    }
    return 1
}
