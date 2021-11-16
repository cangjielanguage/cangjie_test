// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    let a = @{1,0}
    let c = a[1>0] // EXPECTED: regex the index must be of type Int64
    return c
}
