// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func main(): Int64 {
    var list1: Array<Int32> =  @{1,2,3,4,2147483649} // EXPECTED: regex the number '2147483649' exceeds the value range of type 'Int32'
    list1[4]
    list1[9223372036854775808]  // EXPECTED: regex the number '9223372036854775808' exceeds the value range of type 'Int64'
    return 0
}