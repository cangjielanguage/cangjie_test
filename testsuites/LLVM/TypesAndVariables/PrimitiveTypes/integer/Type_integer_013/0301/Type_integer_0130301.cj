// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let uint16_One: UInt16 = -1     // EXPECTED: regex the number '-1' exceeds the value range of type 'UInt16'

    if (uint16_One == -1) {
        return 1
    } else {
        return 0
    }
}
