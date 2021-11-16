// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign{ // EXPECTED: regex 'foreign' modifier is illegal for type declaration in top level
type mytype = Int32
}
