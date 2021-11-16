// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var s1 = "".clone()
    var s2 = " ".clone()
    var s3 = "Cangjie".clone()
    var s4 = "${s3}!".clone()
    var a = "仓颉！\u{255}"
    var s5 = a.clone()
    var s6 = String(['1','2','3']).clone()
    if (s1 == "" && s2 == " " && s3 == "Cangjie" && s4 == "Cangjie!" && s5 == "仓颉！\u{255}" && s6 == "123") {
        return 0
    }
    return 1
}
