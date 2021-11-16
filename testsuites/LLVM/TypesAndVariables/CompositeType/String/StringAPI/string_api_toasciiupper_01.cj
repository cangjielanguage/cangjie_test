// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = "ABCDE".toAsciiUpper()
    var r2 = "abcde".toAsciiUpper()
    var r3 = "仓颉字体".toAsciiUpper()
    var r4 =  String().toAsciiUpper()
    var a5 = Array<UInt8>([65,32,66,99])
    var r5 =  String.fromUtf8(a5,start:0,length:4).toAsciiUpper()
    var r6 = "abc,abc!abc1abc abc$abc中abc".toAsciiUpper()
    var r7 = "çabcçabc".toAsciiUpper()
    var r8 = "abc\naBc".toAsciiUpper()
    if ( r1 != "ABCDE" ){
        return 1
    }
    if ( r2 != "ABCDE"  ){
        return 2
    }
    if ( r3 != "仓颉字体" ){
        return 3
    }
    if ( r4 != "" ){
        return 4
    }
    if ( r5 != "A BC" ){
        return 5
    }
    if ( r6 != "ABC,ABC!ABC1ABC ABC$ABC中ABC" ){
        return 6
    }
    if ( r8 != "ABC\nABC" ){
        return 7
    }
    return 0
}