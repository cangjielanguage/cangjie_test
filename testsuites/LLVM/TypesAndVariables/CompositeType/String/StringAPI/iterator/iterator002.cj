// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64 {
    var str1 = "仓颉"
    var str2 = "CangJie"
    var res1: String
    let iterable = str1.utf8View
    for (i in iterable) {
        res1 = res1 + i.toString()      // EXPECTED: regex variable 'res1' is used before initialization
    }

    if (res1=="228187147233162137") {
        return 0
    }

    return 1
}
