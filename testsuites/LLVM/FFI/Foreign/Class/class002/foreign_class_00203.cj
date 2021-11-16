// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

abstract foreign class A{
func a():Unit // EXPECTED: regex function 'a' has overload conflicts
func a():Unit // EXPECTED: regex function 'a' has overload conflicts
}
