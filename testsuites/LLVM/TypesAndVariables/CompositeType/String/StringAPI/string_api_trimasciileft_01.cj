// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = " ab cb ".trimAsciiLeft()
    var r2 = "".trimAsciiLeft()
    var r3 = "中国中".trimAsciiLeft()
    var r4 =  String().trimAsciiLeft()
    var r7 = " ".trimAsciiLeft()

    if ( r1 != "ab cb " ){
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
    if ( r7 != "" ){
        return 7
    }

    return 0
}