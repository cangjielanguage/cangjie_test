// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = "ABCDE".toAsciiTitle()
    var r2 = "abcde".toAsciiTitle()
    var r3 = "仓颉字体".toAsciiTitle()
    var r4 =  String().toAsciiTitle()
    var a5 = Array<UInt8>([65,32,66,99]) // A Bc
    var r5 =  String.fromUtf8(a5,start:0,length:4).toAsciiTitle()
    var r6 = "仓aBCDE 仓aBCDE".toAsciiTitle()
    if ( r1 != "Abcde" ){
    //    print("${r1}")
        return 1
    }
    if ( r2 != "Abcde"  ){
        return 2
    }
    if ( r3 != "仓颉字体" ){
        return 3
    }
    if ( r4 != "" ){
        return 4
    }
    if ( r5 != "A Bc" ){
    //    print("${r5}")
        return 5
    }
    if ( r6 != "仓Abcde 仓Abcde" ){
        print("${r1}")
        return 6
    }

    return 0
}
