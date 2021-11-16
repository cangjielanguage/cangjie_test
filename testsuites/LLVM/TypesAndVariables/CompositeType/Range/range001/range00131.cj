// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let a = Int8(1)..1:Int16(1)  // EXPECTED: regex step must be int64 in range expression
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
