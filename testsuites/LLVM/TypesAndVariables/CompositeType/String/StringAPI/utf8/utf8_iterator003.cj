// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



// 英文字符串
func main():Int64 {
    var str1 = "仓颉"
    var str2 = "CangJie"
    var res1: String = ""
    let iterable = str2.utf8View
    for (i in iterable) {
        res1 = res1 + i.toString()+" "
    }
    if (res1=="67 97 110 103 74 105 101 ") {
        return 0
    }

    return 1
}
