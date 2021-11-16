// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var s1 = "".reverse()
    var s2 = " ".reverse()
    var s3 = "Cangjie".reverse()
    var s4 = "${s3}!".reverse()
    var a = "仓颉！\u{255}"
    var s5 = a.reverse()
    var s6 = String(['1','2','3']).reverse()

    if (s1 == "" && s2 == " " && s3 == "eijgnaC" && s4 == "!Cangjie" && s5 == "\u{255}！颉仓" && s6 == "321") {
        return 0
    }
    return 1
}
