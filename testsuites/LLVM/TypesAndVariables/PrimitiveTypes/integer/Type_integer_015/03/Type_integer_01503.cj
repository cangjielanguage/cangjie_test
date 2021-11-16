// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var uint32_One: UInt32 = -1     // EXPECTED: regex the number '-1' exceeds the value range of type 'UInt32'

    if (uint32_One == -1) {
        return 1
    } else {
        return 0
    }
}
