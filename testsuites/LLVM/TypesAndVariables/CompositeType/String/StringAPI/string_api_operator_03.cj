// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abcdb"
    var res1 = str1*2
    if ( res1 != "abcdbabcdb" ){
        return 1
    }
    var res2 = "中国中"*2
    if ( res2 != "中国中中国中" ){
        return 2
    }
    return 0
}

