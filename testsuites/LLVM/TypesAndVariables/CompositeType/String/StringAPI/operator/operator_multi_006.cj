// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var s1 = "仓颉" +"1" * 2
    var s2 = ("仓颉" +"1") * 2
    if (s1 == "仓颉11" && s2 == "仓颉1仓颉1") {
        return 0
    }
    return 1
}