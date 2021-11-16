// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var b : Int32 = 1
    let a = @{1,0}
    let c = a[b] // EXPECTED: regex the index must be of type Int64
    return c
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
