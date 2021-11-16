// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



// 字符串中含转义字符
func main():Int64 {
    var str = "\u{516}\u{1000}"
    var res = ""
    let iterable1 = str.utf8View
    for (i in iterable1) {
        res = res + i.toString() + " "
    }

    if (res=="212 150 225 128 128 ") {
        return 0
    }

    return 1
}
