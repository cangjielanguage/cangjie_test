// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:Int32 = -2147483648-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:Int32 = -2147483648-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:Int32 = -2147483649+1       //EXPECTED: regex error.*the number '-2147483649' exceeds the value range of type 'Int32'
    var a4:Int32 = -(-2147483648)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:Int32 = 2147483647+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:Int32 = 2147483647+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:Int32 = 2147483648-1       //EXPECTED: regex error.*the number '2147483648' exceeds the value range of type 'Int32'
    var a8:Int32 = 1+2147483647       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:Int32 = 2147483647*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:Int32 = 2147483648*0       //EXPECTED: regex error.*the number '2147483648' exceeds the value range of type 'Int32'
    var a11:Int32 = (-2147483648)*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a12:Int32 = 1073741824*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:Int32 = (-1073741825)*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a14:Int32 = 2**31      //EXPECTED: regex error.*overflow in 'Power' calculation
    return 0
}
