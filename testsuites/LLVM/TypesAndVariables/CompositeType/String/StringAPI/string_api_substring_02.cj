// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res = "中国".substring(0,1)
    if ( res != "中" ){
        return 1
    }
    if ( "中国".substring(1,1) != "国" ){
        return 1
    }
    return 0
}
