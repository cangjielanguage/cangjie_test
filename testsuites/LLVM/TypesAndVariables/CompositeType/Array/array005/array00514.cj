// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let a = @{0,1}
    let c = a[true||true] // EXPECTED: regex the index must be of type Int64
    return c
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
