// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
   let a: Int8 = 0o40 + 0o140 // EXPECTED: regex overflow in 'Addition' calculation

    return 0
}