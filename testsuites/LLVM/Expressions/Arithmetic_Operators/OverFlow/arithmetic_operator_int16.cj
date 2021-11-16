// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:Int16 = -32768-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:Int16 = -32768-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:Int16 = -32769+1       //EXPECTED: regex error.*the number '-32769' exceeds the value range of type 'Int16'
    var a4:Int16 = -(-32768)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:Int16 = 32767+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:Int16 = 32767+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:Int16 = 32768-1       //EXPECTED: regex error.*the number '32768' exceeds the value range of type 'Int16'
    var a8:Int16 = 1+32767       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:Int16 = 32767*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:Int16 = 32768*0       //EXPECTED: regex error.*the number '32768' exceeds the value range of type 'Int16'
    var a11:Int16 = (-32768)*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a12:Int16 = 16384*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:Int16 = (-16385)*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a14:Int16 = 2**15      //EXPECTED: regex error.*overflow in 'Power' calculation
    return 0
}
