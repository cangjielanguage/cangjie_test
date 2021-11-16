// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:UInt32 = 0-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:UInt32 = 0-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:UInt32 = -1+1       //EXPECTED: regex error.*the number '-1' exceeds the value range of type 'UInt32'
    var a4:UInt32 = -(-0)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:UInt32 = 4294967295+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:UInt32 = 4294967295+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:UInt32 = 4294967296-1       //EXPECTED: regex error.*the number '4294967296' exceeds the value range of type 'UInt32'
    var a8:UInt32 = 1+4294967295       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:UInt32 = 4294967295*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:UInt32 = 4294967296*0       //EXPECTED: regex error.*the number '4294967296' exceeds the value range of type 'UInt32'
    var a11:UInt32 = (0)*3/3        //EXPECTED: regex-not error
    var a12:UInt32 = 2147483648*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:UInt32 = (-0)*2        //EXPECTED: regex-not error
    var a14:UInt32 = 2**32    //EXPECTED: regex error.*overflow in 'Power' calculation
    var a15:UInt32 = -0 //EXPECTED: regex-not error
    return 0
}
