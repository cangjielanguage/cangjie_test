// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 字符串不包含相应字符
func main():Int64 {
    var s1 = "".contains(" ")
    var s3 = "Cangjie".contains("Cangjie1")
    var s4 = "Cangjie".contains("2")
    var a = "仓颉！\u{255}"
    var s5 = a.contains("\u{256}")
    var s6 = String(['1','2','3']).contains(" ")

    if (!s1 && !s3 && !s4 && !s5 && !s6 ) {
        return 0
    }
    return 1
}
