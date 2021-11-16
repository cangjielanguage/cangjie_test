// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal foreign var a = 1 // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in variable declaration
internal foreign let b = 1 // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in variable declaration

foreign {
internal var c = 1 // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in variable declaration
internal let d = 1 // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in variable declaration
}
