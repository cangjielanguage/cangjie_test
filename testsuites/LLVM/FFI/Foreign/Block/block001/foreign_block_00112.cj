// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign func foo(a:Int8):Int8 // EXPECTED:regex redefinition of declaration 'foo'
foreign{
func foo(a:Int16):Int16 // EXPECTED:regex redefinition of declaration 'foo'
}
