// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal foreign class A{} // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in class declaration

foreign {
internal class B{} // EXPECTED: regex modifiers 'internal' and 'foreign' are conflict in class declaration
}
