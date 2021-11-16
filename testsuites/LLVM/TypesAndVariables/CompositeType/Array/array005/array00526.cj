// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex the index must be of type Int64
func main(): Int64 {
    var c = 1
    var b = 0
    let a = @{1,0}
    c = a[b++]
    return c
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
