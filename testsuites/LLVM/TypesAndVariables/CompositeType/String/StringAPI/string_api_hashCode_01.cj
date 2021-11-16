// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abc"
    var str2 = ""
    var str3 = "中国"
    var res1 = str1.hashCode()
    var res2 = str2.hashCode()
    var res3 = str3.hashCode()
    if ( res1 != 193485963 ){
        return 1
    }
    if ( res2 != 5381 ){
        return 2
    }
    if ( res3 != 689672523 ){
        return 3
    }
    return 0
}
