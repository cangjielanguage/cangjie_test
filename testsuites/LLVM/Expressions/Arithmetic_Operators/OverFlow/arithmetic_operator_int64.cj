// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:Int64 = -9223372036854775808-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:Int64 = -9223372036854775808-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:Int64 = -9223372036854775809+1       //EXPECTED: regex error.*the number '-9223372036854775809' exceeds the value range of type 'Int64'
    var a4:Int64 = -(-9223372036854775808)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:Int64 = 9223372036854775807+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:Int64 = 9223372036854775807+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:Int64 = 9223372036854775808-1       //EXPECTED: regex error.*the number '9223372036854775808' exceeds the value range of type 'Int64'
    var a8:Int64 = 1+9223372036854775807       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:Int64 = 9223372036854775807*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:Int64 = 9223372036854775808*0       //EXPECTED: regex error.*the number '9223372036854775808' exceeds the value range of type 'Int64'
    var a11:Int64 = (-9223372036854775808)*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a12:Int64 = 4612686018427387904*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:Int64 = (-4612686018427387905)*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a14:Int64 = 2**63      //EXPECTED: regex error.*overflow in 'Power' calculation
    return 0
}
