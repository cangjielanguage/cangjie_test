// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func main(): Int64{
    let a = Array<Int32>(if (true) {5},5) // EXPECTED: regex array size must be of type Int64
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
