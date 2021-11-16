// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abcaef"
    var str3 = "中国中"
    var res1 = str1.split("a")
    var res2 = str1.split('a')
    var res3 = str3.split("中")
    var res4 = str3.split('中')
    for ( i in res1 ){
        if ( i == "bc" ){
            return 0
        }
    }
    return 1
}
