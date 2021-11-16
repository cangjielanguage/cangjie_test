// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'uint64_One'

func main(): Int64 {
    var uint64_One: Int64 = 12345.5

    if (uint64_One == 12345) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
