// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
foreign interface B{} // EXPECTED: regex 'foreign' modifier is illegal for interface declaration in class body
}
