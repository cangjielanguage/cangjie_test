// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// **在入参中解析
func main(): Int64 {
    let a = [**[[1,2]],[3]]   // EXPECTED: regex inconsistent element type for List literal
    if (a == 8) {
        return 0
    }
    return 1
}
