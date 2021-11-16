// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let uint16_One: UInt16= 65536       // EXPECTED: regex the number '65536' exceeds the value range of type 'UInt16'

    if (uint16_One == 65536) {
        return 1
    } else {
        return 0
    }
}
