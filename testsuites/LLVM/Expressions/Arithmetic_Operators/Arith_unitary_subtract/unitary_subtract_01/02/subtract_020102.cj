// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
   let a: Int16 = -_8 // EXPECTED: regex redundant operator
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
