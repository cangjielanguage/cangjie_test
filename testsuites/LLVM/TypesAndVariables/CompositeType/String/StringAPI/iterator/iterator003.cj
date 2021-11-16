// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex \"Cangjie1仓颉！ɕ123


func main():Int64 {
    var iter1 = "".iterator()
    var iter3 = "\"".iterator()
    var iter4 = "Cangjie".iterator()
    var iter5 = "1".iterator()
    var a = "仓颉！\u{255}"
    var iter6 = a.iterator()
    var iter7 = String(['1','2','3']).iterator()

    for (i in iter1) {
        print("${i}")
    }
    for (i in iter3) {
        print("${i}")
    }
    for (i in iter4) {
        print("${i}")
    }
    for (i in iter5) {
        print("${i}")
    }
    for (i in iter6) {
        print("${i}")
    }
    for (i in iter7) {
        print("${i}")
    }

    return 0
}
