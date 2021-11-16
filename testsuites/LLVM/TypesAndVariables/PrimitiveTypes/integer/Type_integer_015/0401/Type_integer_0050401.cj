// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let uint32_One: UInt32= 4294967296      // EXPECTED: regex the number '4294967296' exceeds the value range of type 'UInt32'

    if (uint32_One == 4294967296) {
        return 1
    } else {
        return 0
    }
}
