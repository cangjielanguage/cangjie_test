// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
func a():Unit // EXPECTED: regex function 'a' has overload conflicts
func a():Unit // EXPECTED: regex function 'a' has overload conflicts
func b():Unit // EXPECTED: regex function 'b' has overload conflicts
func b():Unit // EXPECTED: regex function 'b' has overload conflicts
static func c():Unit // EXPECTED: regex function 'c' has overload conflicts
static func c():Unit // EXPECTED: regex function 'c' has overload conflicts
}

foreign{
interface B{
func a():Unit // EXPECTED: regex function 'a' has overload conflicts
func a():Unit // EXPECTED: regex function 'a' has overload conflicts
func b():Unit // EXPECTED: regex function 'b' has overload conflicts
func b():Unit // EXPECTED: regex function 'b' has overload conflicts
static func c():Unit // EXPECTED: regex function 'c' has overload conflicts
static func c():Unit // EXPECTED: regex function 'c' has overload conflicts
}
}
