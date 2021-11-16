// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = "ab cb".isAsciiBlank() // false
    var r2 = "".isAsciiBlank() // true
    var r3 = "中国中".isAsciiBlank() // false
    var r4 =  String().isAsciiBlank() // true
    var a5 = Array<UInt8>([97,09,98,99])
    var r5 =  String.fromUtf8(a5,start:0,length:4).isAsciiBlank() //false
    var r6 = String.fromUtf8(Array<UInt8>([32,09,10,11,12,13]),start:0,length:6).isAsciiBlank() // true
    var r11 = " ".isAsciiBlank() // 32
    var r12 = String.fromUtf8(Array<UInt8>([09]),start:0,length:1).isAsciiBlank()
    var r13 = String.fromUtf8(Array<UInt8>([10]),start:0,length:1).isAsciiBlank()
    var r14 = String.fromUtf8(Array<UInt8>([11]),start:0,length:1).isAsciiBlank()
    var r15 = String.fromUtf8(Array<UInt8>([12]),start:0,length:1).isAsciiBlank()
    var r16 = String.fromUtf8(Array<UInt8>([13]),start:0,length:1).isAsciiBlank()

    if ( r1 ){
        return 1
    }
    if ( !r2 ){
        return 2
    }
    if ( r3 ){
        return 3
    }
    if ( !r4 ){
        return 4
    }
    if ( r5 ){
        return 5
    }
    if ( !r6 ){
        return 6
    }
    if ( !r11 || !r12 || !r13 || !r14 || !r15 || !r16){
        return 6
    }
    return 0
}