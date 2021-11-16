// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abc"
    var str2 = ""
    var str3 = "中国"
    var res3 = str3.contains('中')
    var res4 = str1.contains('中')
    var res5 = str2.contains('中')
    if ( !res3 ){
        return 3
    }
    if ( res4 ){
        return 4
    }
    if ( res5 ){
        return 4
    }
    return 0
}
