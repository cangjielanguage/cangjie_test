// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res1 = (3.14, "PIE")[0]     // pass
    var res2 = (3.14, "PIE")[1]     // pass
    var res3 = (3.14, ("PIE",1))[0]     // pass
    var res4 = (3.14, ("PIE",2))[1][0]  // core dump
    if (res1 == 3.14 && res2 == "PIE" && res3 == 3.14 && res4 == "PIE") {
        return 0
    }
    return 1
}
