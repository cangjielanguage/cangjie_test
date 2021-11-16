// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign func foo(a:This):This // EXPECTED: regex 'This' type is not allowed here

foreign {
func bar(a:This):This // EXPECTED: regex 'This' type is not allowed here
}
