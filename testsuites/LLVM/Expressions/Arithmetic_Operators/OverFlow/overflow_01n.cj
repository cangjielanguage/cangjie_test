// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    // list
    var list1: Array<Int32> =  @{1,2,3,4,2147483649} // EXPECTED: regex the number '2147483649' exceeds the value range of type 'Int32'
    list1[4]
    list1[9223372036854775808]  // EXPECTED: regex the number '9223372036854775808' exceeds the value range of type 'Int64'

    // range
    var rge= 9223372036854775808..9223372036854775808:9223372036854775808 //EXPECTED: regex the number '9223372036854775808' exceeds the value range of type 'Int64'

    // tuple
    var tpl = (1,23,4,-9223372036854775810)  // EXPECTED: regex  the number '-9223372036854775810' exceeds the value range of type 'Int'
    tpl[9223372036854775809]    // EXPECTED: regex tuple index must be in bounds
    print(tpl[3].toString())
    return 0
}