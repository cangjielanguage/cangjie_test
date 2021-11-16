// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var a1:Int8 = -128-1+1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a2:Int8 = -128-1       //EXPECTED: regex error.*overflow in 'Subtraction' calculation
    var a3:Int8 = -129+1       //EXPECTED: regex error.*the number '-129' exceeds the value range of type 'Int8'
    var a4:Int8 = -(-128)       //EXPECTED: regex error.*overflow in 'Unary Minus' calculation
    var a5:Int8 = 127+1-1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a6:Int8 = 127+1       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a7:Int8 = 128-1       //EXPECTED: regex error.*the number '128' exceeds the value range of type 'Int8'
    var a8:Int8 = 1+128       //EXPECTED: regex error.*overflow in 'Addition' calculation
    var a9:Int8 = 127*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a10:Int8 = 128*0       //EXPECTED: regex error.*the number '128' exceeds the value range of type 'Int8'
    var a11:Int8 = (-128)*3/3        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a12:Int8 = 64*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a13:Int8 = (-65)*2        //EXPECTED: regex error.*overflow in 'Multiply' calculation
    var a14:Int8 = 2**7      //EXPECTED: regex error.*overflow in 'Power' calculation
    return 0
}
