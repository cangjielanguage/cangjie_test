// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64{
    var myArray = Array<Int32>(9223372036854775808,0) //EXPECTED: regex the number '9223372036854775808' exceeds the value range of type 'Int64'
    return 0
}
