// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abcdb"
    var str2 = ""
    var res1 = str1 + 'a'
    if ( res1 != "abcdba" ){
        return 1
    }
    var res2 = "中国中"+'中'
    if ( res2 != "中国中中" ){
        return 2
    }
    var res3 = str2 + str2
    if ( res3 != "" ){
        return 3
    }
    return 0
}

