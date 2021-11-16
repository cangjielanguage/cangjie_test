// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let int8_Low_Median_One: Int8 = -129    // EXPECTED: regex the number '-129' exceeds the value range of type 'Int8'

    if (int8_Low_Median_One == -129) {
        return 1
    } else {
        return 0
    }
}
