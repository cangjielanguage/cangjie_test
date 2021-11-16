// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a5 = Array<UInt8>([09,97,32,98,99,32])
    var r5 =  String.fromUtf8(a5,start:0,length:5).trimAscii()
    var r6 = String.fromUtf8(Array<UInt8>([32,09,10,11,65,97,12,13]),start:0,length:8).trimAscii()
    if ( r5 != "a bc" ){
        return 5
    }
    if ( r6 != "Aa" ){
        return 6
    }
    return 0
}