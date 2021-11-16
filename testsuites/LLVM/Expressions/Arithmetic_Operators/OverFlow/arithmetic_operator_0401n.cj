// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a1:Int8 = -128<<1       
    var a2:Int8 = -256>>1       //EXPECTED: regex the number '-256' exceeds the value range of type 'Int8'
    var a3:Int8 = 258>>1        //EXPECTED: regex the number '258' exceeds the value range of type 'Int8'
    var a4:Int8 = 65<<1         
    return 0
}