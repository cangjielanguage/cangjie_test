// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
func a(input:Int16):Int8 // EXPECTED: regex function 'a' has overload conflicts
func a(input:Int16):Int32 // EXPECTED: regex function 'a' has overload conflicts
}

foreign{
class B{
func a(input:Int16):Int8 // EXPECTED: regex function 'a' has overload conflicts
func a(input:Int16):Int32// EXPECTED: regex function 'a' has overload conflicts
}
}
