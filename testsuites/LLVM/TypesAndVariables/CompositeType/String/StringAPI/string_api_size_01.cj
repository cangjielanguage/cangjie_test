// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var s3 = "中国中"
    if ( s3.size() != 3 ){
        return 1
    }
    return 0
}
