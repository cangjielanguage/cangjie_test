// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r11 = String.fromUtf8(Array<UInt8>([32,65]),start:0,length:2).trimAsciiLeft()
    var r12 = String.fromUtf8(Array<UInt8>([09,65]),start:0,length:2).trimAsciiLeft()
    var r13 = String.fromUtf8(Array<UInt8>([10,65]),start:0,length:2).trimAsciiLeft()
    var r14 = String.fromUtf8(Array<UInt8>([11,65]),start:0,length:2).trimAsciiLeft()
    var r15 = String.fromUtf8(Array<UInt8>([12,65]),start:0,length:2).trimAsciiLeft()
    var r16 = String.fromUtf8(Array<UInt8>([13,65]),start:0,length:2).trimAsciiLeft()

    if ( (r11 != "A") || (r12 != "A") || (r13 != "A") || (r14 != "A") || (r15 != "A") || (r16 != "A")){
        return 11
    }

    return 0
}