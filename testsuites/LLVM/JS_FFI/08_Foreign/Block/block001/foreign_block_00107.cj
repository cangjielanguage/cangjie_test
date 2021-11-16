// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign{
func foo():Int8 // EXPECTED: regex function 'foo' has overload conflicts
func foo():Int8 // EXPECTED: regex function 'foo' has overload conflicts
}
