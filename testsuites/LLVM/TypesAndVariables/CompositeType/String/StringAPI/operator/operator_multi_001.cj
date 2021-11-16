// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 中英文字符
func main():Int64 {
    var s1 = "仓颉" * 2
    var s2 = "cangjie" *2
    var s3 = "\u{255}" * 2
    let s4 = "仓颉" * 0
    let s5 = "仓颉" * 1


    if (s1 == "仓颉仓颉" && s2 == "cangjiecangjie" && s3 == "\u{255}\u{255}" && s4 == "" && s5 == "仓颉") {
        return 0
    }
    return 1
}
