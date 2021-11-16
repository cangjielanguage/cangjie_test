// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

abstract foreign class A{
func a(input:Int8):Int16 // EXPECTED: regex function 'a' has overload conflicts
func a(input:Int8):Int32 // EXPECTED: regex function 'a' has overload conflicts
}
