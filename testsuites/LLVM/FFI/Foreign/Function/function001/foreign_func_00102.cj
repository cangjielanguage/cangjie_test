// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign func foo<T>(a:T):T // EXPECTED: regex foreign declaration does not support generics

foreign {
func bar<T>(a:T):T // EXPECTED: regex foreign declaration does not support generics
}
