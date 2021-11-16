// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// * 后数值溢出
func main():Int64 {
    var s1 = "仓颉" * -9223372036854775809    // EXPECTED: regex the number '-9223372036854775809' exceeds the value range of type 'Int64'
    var s2 = "仓颉" * 9223372036854775808 // EXPECTED: regex the number '9223372036854775808' exceeds the value range of type 'Int64'
    return 0
}
