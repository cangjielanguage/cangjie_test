// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 入参为空字符串
func main():Int64 {
    var s1 = "".contains("")
    var s3 = "Cangjie".contains("")
    var s4 = """
    Cangjie""".contains("")
    var a = ##"仓颉！\u{255}"##
    var s5 = a.contains("")
    var s6 = String(['1','2','3']).contains("")

    if (s1 && s3 && s4 && s5 && s6 ) {
        return 0
    }
    return 1
}
