// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex integer type is expected for start, stop and step in range expression
func main(): Int64 {
    let a = while (true) {0}..while (true) {0}:while (true) {0}
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
