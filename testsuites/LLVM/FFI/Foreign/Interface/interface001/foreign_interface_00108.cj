// EXEC:%compiler -frontend -typecheck -backend js %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
func a():Unit
func b():Unit
static func c():Unit
}

foreign{
interface B{
func a():Unit
func b():Unit
static func c():Unit
}
}
// ASSERT: regex-not .
