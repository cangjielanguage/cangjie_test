// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
func a():Int8 // EXPECTED: regex function 'a' has overload conflicts
func a():Int16 // EXPECTED: regex function 'a' has overload conflicts
func b():Int8 // EXPECTED: regex function 'b' has overload conflicts
func b():Int16 // EXPECTED: regex function 'b' has overload conflicts
static func c():Int8 // EXPECTED: regex function 'c' has overload conflicts
static func c():Int16 // EXPECTED: regex function 'c' has overload conflicts
}

foreign{
interface B{
func a():Int8 // EXPECTED: regex function 'a' has overload conflicts
func a():Int16 // EXPECTED: regex function 'a' has overload conflicts
func b():Int8 // EXPECTED: regex function 'b' has overload conflicts
func b():Int16 // EXPECTED: regex function 'b' has overload conflicts
static func c():Int8 // EXPECTED: regex function 'c' has overload conflicts
static func c():Int16 // EXPECTED: regex function 'c' has overload conflicts
}
}
