// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:UInt64 = 0-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:UInt64 = 0-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:UInt64 = -1+1       //EXPECTED: regex error.*the number '-1' exceeds the value range of type 'UInt64'
    var a4:UInt64 = -(-0)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:UInt64 = 18446744073709551615+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:UInt64 = 18446744073709551615+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:UInt64 = 18446744073709551616-1       //EXPECTED: regex error.*the number '18446744073709551616' exceeds the value range of type 'UInt64'
    var a8:UInt64 = 1+18446744073709551615       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:UInt64 = 18446744073709551615*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:UInt64 = 18446744073709551616*0       //EXPECTED: regex error.*the number '18446744073709551616' exceeds the value range of type 'UInt64'
    var a11:UInt64 = (0)*3/3        //EXPECTED: regex-not error
    var a12:UInt64 = 9443372036854775808*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:UInt64 = (-0)*2        //EXPECTED: regex-not error
    var a14:UInt64 = 2**64    //EXPECTED: regex error.*overflow in 'Power' calculation
    var a15:UInt64 = -0 //EXPECTED: regex-not error
    return 0
}
