// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = " ab cb ".trimAscii()
    var r2 = "".trimAscii()
    var r3 = "中国中".trimAscii()
    var r4 =  String().trimAscii()
    if ( r1 != "ab cb" ){
        return 1
    }
    if ( r2 != ""  ){
        return 2
    }
    if ( r3 != "中国中" ){
        return 3
    }
    if ( r4 != "" ){
        return 4
    }
    return 0
}