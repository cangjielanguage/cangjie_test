// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let uint64_One: UInt64= 18446744073709551616    // EXPECTED: regex the number '18446744073709551616' exceeds the value range of type 'UInt64'

    if (uint64_One == 18446744073709551616) {
        return 1
    } else {
        return 0
    }
}