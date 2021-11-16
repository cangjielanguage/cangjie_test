// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = "ABC Abc?AbC".toAsciiLower()
    var r2 = "abc".toAsciiLower()
    var r3 = "仓颉".toAsciiLower()
    var r4 =  String().toAsciiLower()
    var a5 = Array<UInt8>([65,32,66,99])
    var r5 =  String.fromUtf8(a5,start:0,length:4).toAsciiLower()

    if ( r1 != "abc abc?abc" ){
        return 1
    }
    if ( r2 != "abc"  ){
        return 2
    }
    if ( r3 != "仓颉" ){
        return 3
    }
    if ( r4 != "" ){
        return 4
    }
    if ( r5 != "a bc" ){
        return 5
    }
    return 0
}