// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abcdb"
    var res1 = str1[0..3:1]
    if ( res1 != "abc" ){
        return 1
    }
    var res2 = "中国中"[0..2:1]
    if ( res2 != "中国" ){
        return 2
    }
    return 0
}
