// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



// 空字符串
func main():Int64 {
    var str1 = ""
    var str2 = " "
    var res1 = ""
    var res2 = ""
    let iterable1 = str1.utf8View
    let iterable2 = str2.utf8View

    for (i in iterable1) {
        res1 = res1 + i.toString()
    }
    for (i in iterable2) {
        res2 = res2 + i.toString()
    }

    print("res1:${res1}|\n")
    print("res2:${res2}|\n")
    if (res1=="" && res2 == "32") {
        return 0
    }

    return 1
}
