// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    func test():Int32
}

extend A{
    foreign func test2():Unit // EXPECTED: regex 'foreign' modifier is illegal for function declaration in extend body
}