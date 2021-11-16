// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex start and stop must be of the same type in range expression

func main(): Int64 {
    let a = Int8(1)..Int16(1):Int32(1)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
