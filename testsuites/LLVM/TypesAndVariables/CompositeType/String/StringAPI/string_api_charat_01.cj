// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var s1 = "abcb"
    var s2 = ""
    var s3 = "中国中"
    var res = 0
    var r2 = s2.charAt(1)
    var r3 = "中国中".charAt(3)
    if ( r2 != '\0' || r3 != '\0'){
        return 1
    }
    return 0
}
