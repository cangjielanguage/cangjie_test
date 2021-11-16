// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:UInt16 = 0-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:UInt16 = 0-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:UInt16 = -1+1       //EXPECTED: regex error.*the number '-1' exceeds the value range of type 'UInt16'
    var a4:UInt16 = -(-0)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:UInt16 = 65535+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:UInt16 = 65535+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:UInt16 = 65536-1       //EXPECTED: regex error.*the number '65536' exceeds the value range of type 'UInt16'
    var a8:UInt16 = 1+65535       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:UInt16 = 65535*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:UInt16 = 65536*0       //EXPECTED: regex error.*the number '65536' exceeds the value range of type 'UInt16'
    var a11:UInt16 = (0)*3/3        //EXPECTED: regex-not error
    var a12:UInt16 = 32768*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:UInt16 = (-0)*2        //EXPECTED: regex-not error
    var a14:UInt16 = 2**16     //EXPECTED: regex error.*overflow in 'Power' calculation
    var a15:UInt16 = -0 //EXPECTED: regex-not error
    return 0
}
