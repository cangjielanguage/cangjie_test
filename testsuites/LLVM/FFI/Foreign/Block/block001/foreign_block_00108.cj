// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign{
func foo():Int8 // EXPECTED:regex redefinition of declaration 'foo'
func foo():Int16 // EXPECTED:regex redefinition of declaration 'foo'
}
