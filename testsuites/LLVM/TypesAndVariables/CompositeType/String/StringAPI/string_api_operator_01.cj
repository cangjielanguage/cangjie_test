// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abc"
    var str3 = "中国"
    var res1 = str1[1]
    var res3 = str3[1] // 0xAD
    if ( res1 != 'b' ){
        return 1
    }
    if ( res3 != '国' ){
        return 3
    }
    return 0
}
