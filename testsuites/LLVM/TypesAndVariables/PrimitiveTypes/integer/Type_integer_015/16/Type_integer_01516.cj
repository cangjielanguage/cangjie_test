// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'uint32_One'

func main(): Int64 {
    var uint32_One: Int32 = 12345.5

    if (uint32_One == 12345) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
