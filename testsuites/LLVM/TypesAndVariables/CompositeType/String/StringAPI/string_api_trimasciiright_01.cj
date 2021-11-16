// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = " ab cb ".trimAsciiRight()
    var r2 = "".trimAsciiRight()
    var r3 = "中国中".trimAsciiRight()
    var r4 =  String().trimAsciiRight()
    var a5 = Array<UInt8>([32,97,32,98,99,32])
    var r5 =  String.fromUtf8(a5,start:0,length:6).trimAsciiRight()
    var r6 = String.fromUtf8(Array<UInt8>([32,65,97,32,65,09,10,11,12,13]),start:0,length:10).trimAsciiRight()
    if ( r1 != " ab cb" ){
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
    if ( r5 != " a bc" ){
        return 5
    }
    if ( r6 != " Aa A" ){
        return 6
    }
    return 0
}