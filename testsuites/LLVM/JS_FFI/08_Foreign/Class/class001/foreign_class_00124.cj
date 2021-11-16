// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    abstract func foo():Unit  // EXPECTED: regex 'abstract' modifier is illegal for function declaration in class body
}