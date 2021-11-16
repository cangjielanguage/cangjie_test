// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abc"
    var str2 = ""
    var str3 = "中国"
    var res1 = str1.charCount()
    var res2 = str2.charCount()
    var res3 = str3.charCount()
    if ( res1 != 3 ){
        return 1
    }
    if ( res2 != 0 ){
        return 2
    }
    if ( res3 != 2 ){
        return 3
    }
    return 0
}
