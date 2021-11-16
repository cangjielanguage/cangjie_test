// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
    func test():Int64
}

class C <: A{  // EXPECTED: regex xxx
    func test():Int64{1}
}
