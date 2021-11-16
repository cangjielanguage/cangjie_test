// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign func foo():Unit{} // EXPECTED: regex foreign function can not have body

foreign {
func bar():Unit{} // EXPECTED: regex foreign function can not have body
}
