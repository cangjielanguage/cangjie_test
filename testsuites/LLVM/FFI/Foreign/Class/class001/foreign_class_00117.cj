// EXEC:%compiler -frontend -typecheck -backend js %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


foreign class A{
static func foo():Unit
}

foreign{
class B{
static func foo():Unit
}
}

// ASSERT: regex-not .
