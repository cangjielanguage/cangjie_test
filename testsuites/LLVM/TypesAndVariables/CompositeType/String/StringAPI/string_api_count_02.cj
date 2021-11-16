// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abca"
    var str3 = "中国中"
    var res2 = str1.count('a')
    var res4 = str3.count('中')
    if ( res2 != 2 ){
        return 2
    }
    if ( res4 != 2 ){
        return 4
    }
    return 0
}
