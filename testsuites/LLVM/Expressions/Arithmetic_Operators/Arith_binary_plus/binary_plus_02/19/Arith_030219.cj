// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    let a: UInt32 = 1 + 4294967295 // EXPECTED: regex overflow in 'Addition' calculation

    return 0
}