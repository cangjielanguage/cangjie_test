// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abcac"
    var str3 = "中国中国会"
    var res1 = str1.count("a")
    var res2 = str1.count("a*")
    var res3 = str3.count("中")
    var res4 = str3.count("国中")
    if ( res1 != 2 ){
        return 1
    }
    if ( res2 != 0 ){
        return 1
    }
    if ( res3 != 2 ){
        return 3
    }
    if ( res4 != 1 ){
        return 1
    }
    return 0
}
