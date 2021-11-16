// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



// 字面量直接调用
func main():Int64 {
    var res1: String = ""
    let iterable = "仓颉".utf16View
    for (i in iterable) {
        res1 = res1 + i.toString() + " "
    }
    if (res1=="20179 39049 ") {
        return 0
    }

    return 1
}
