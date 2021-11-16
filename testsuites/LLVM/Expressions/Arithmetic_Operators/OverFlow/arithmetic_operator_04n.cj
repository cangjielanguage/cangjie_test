// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a1:Int8 = -128-1+1       //EXPECTED: regex overflow in 'Subtraction' calculation
    var a2:Int8 = 127*3/3        //EXPECTED: regex overflow in 'Multiply' calculation
    var b1: Int16 = -32768*2/2  //EXPECTED: regex overflow in 'Multiply' calculation
    var b2: Int16 = 32767+1-1   //EXPECTED: regex overflow in 'Addition' calculation
    var c1: Int32 = -2147483648-1+1 //EXPECTED: regex overflow in 'Subtraction' calculation
    var c2: Int32 = 2147483647*2/2  //EXPECTED: regex overflow in 'Multiply' calculation
    var d1: Int64 = -9223372036854775808**3**-3 //EXPECTED: regex overflow in 'Power' calculation
    var d2: Int64 = 9223372036854775807*2/2 //EXPECTED: regex overflow in 'Multiply' calculation
    return 0
}