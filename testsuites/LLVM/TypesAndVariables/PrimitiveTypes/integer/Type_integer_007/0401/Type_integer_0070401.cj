// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let int64_One: Int64= 9223372036854775808   // EXPECTED: regex the number '9223372036854775808' exceeds the value range of type 'Int64'

    if (int64_One == 9223372036854775808) {
        return 1
    } else {
        return 0
    }
}