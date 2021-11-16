// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abc"
    var str2 = ""
    var str3 = "中国"
    var res1 = str1.concat("")
    var res2 = str2.concat("")
    var res3 = str3.concat("中")
    if ( res1 != "abc" ){
        return 1
    }
    if ( res2 != "" ){
        return 2
    }
    if ( res3 != "中国中" ){
        return 3
    }
    return 0
}
