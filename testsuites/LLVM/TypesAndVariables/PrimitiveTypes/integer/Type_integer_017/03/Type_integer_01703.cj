// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var uint64_One: UInt64 = -1     // EXPECTED: regex the number '-1' exceeds the value range of type 'UInt64'

    if (uint64_One == -1) {
        return 1
    } else {
        return 0
    }
}
