// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 索引范围内的操作符
func foo():String {
    return "cangjie"
}

func main(): Int64 {
    var str = "Cangjie"
    var s1 = "仓颉"[..]*2
    var s2 = str[1..]*2
    var s3 = foo()[..3]
    var s4 = "仓颉"[0..2:-1]
    var s4_1 = "仓颉仓颉"[3..0:-1]
    var s5 = "仓颉仓颉"[0..4:2]
    var s6 = "仓颉仓颉"[0..4:4]

    if (s1 == "仓颉仓颉" && s2 == "angjieangjie" && s3 == "can" && s4 == "" && s4_1 == "颉仓颉" && s5 =="仓仓" && s6 =="仓") {
        return 0
    }
    return 1
}

