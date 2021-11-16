// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let int16_One: Int16 = -32769   // EXPECTED: regex the number '-32769' exceeds the value range of type 'Int16'

    if (int16_One == -32769) {
        return 1
    } else {
        return 0
    }
}
