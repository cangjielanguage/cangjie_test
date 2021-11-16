// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var int32_One: Int32= 2147483648    // EXPECTED: regex the number '2147483648' exceeds the value range of type 'Int32'

    if (int32_One == 2147483648) {
        return 1
    } else {
        return 0
    }
}
