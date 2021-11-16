// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let int8_Low_Median_One: Int8 = 128 // EXPECTED: regex the number '128' exceeds the value range of type 'Int8'

    if (int8_Low_Median_One == 128) {
        return 1
    } else {
        return 0
    }
}
