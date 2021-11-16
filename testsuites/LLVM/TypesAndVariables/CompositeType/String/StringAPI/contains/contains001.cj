// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 正常的contains
func main():Int64 {
    var s1 = "".contains("")
    var s2 = " ".contains(" ")
    var s3 = "Cangjie".contains("jie")
    var b = "Cangjie"
    var s4 = "${b}!".contains("ang")
    var a = "仓颉！\u{255}"
    var s5 = a.contains("仓颉")
    var s6 = String(['1','2','3']).contains("1")

    if (s1 && s2  && s3 && s4 && s5 && s6 ) {
        return 0
    }
    return 1
}
