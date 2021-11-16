// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{}

extend A{
    foreign func test():Unit // EXPECTED: regex 'foreign' modifier is illegal for function declaration in extend body
}
