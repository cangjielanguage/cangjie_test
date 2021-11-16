// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var c = 0
    let b = @{1,0}
    c = b[while (true) {1}] // EXPECTED: regex the index must be of type Int64
    return c
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
