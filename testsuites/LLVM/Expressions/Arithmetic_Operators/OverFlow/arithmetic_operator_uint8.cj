// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:UInt8 = 0-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:UInt8 = 0-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:UInt8 = -1+1       //EXPECTED: regex error.*the number '-1' exceeds the value range of type 'UInt8'
    var a4:UInt8 = -(-0)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:UInt8 = 255+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:UInt8 = 255+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:UInt8 = 256-1       //EXPECTED: regex error.*the number '256' exceeds the value range of type 'UInt8'
    var a8:UInt8 = 1+255       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:UInt8 = 255*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:UInt8 = 256*0       //EXPECTED: regex error.*the number '256' exceeds the value range of type 'UInt8'
    var a11:UInt8 = (0)*3/3        //EXPECTED: regex-not error
    var a12:UInt8 = 128*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:UInt8 = (-0)*2        //EXPECTED: regex-not error
    var a14:UInt8 = 2**8     //EXPECTED: regex error.*overflow in 'Power' calculation
     var a15:UInt8 = -0 //EXPECTED: regex-not error
    return 0
}
