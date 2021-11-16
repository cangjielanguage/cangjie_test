// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal foreign func foo():Unit // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in function declaration

foreign {
internal func bar():Unit // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in function declaration
}
