// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



// 中文字符串
func main():Int64 {
    var str1 = "仓颉"
    var str2 = "CangJie"
    var res1: String = ""
    let iterable = str1.utf32View
    for (i in iterable) {
        res1 = res1 + i.toString() + " "
    }
    print("res1:${res1}|\n")
    if (res1=="20179 39049 ") {
        return 0
    }

    return 1
}
