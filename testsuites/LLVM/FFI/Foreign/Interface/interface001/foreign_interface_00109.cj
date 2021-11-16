// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
func a():Unit{} // EXPECTED: regex foreign function can not have body
func b():Unit{} // EXPECTED: regex foreign function can not have body
static func c():Unit{} // EXPECTED: regex foreign function can not have body
}

foreign{
interface B{
func a():Unit{} // EXPECTED: regex foreign function can not have body
func b():Unit{} // EXPECTED: regex foreign function can not have body
static func c():Unit{} // EXPECTED: regex foreign function can not have body
}
}
