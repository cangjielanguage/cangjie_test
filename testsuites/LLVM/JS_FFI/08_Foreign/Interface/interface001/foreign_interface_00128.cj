// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
    static var a:Int64 // EXPECTED: regex variable 'a' can not be declared in interface
}

foreign interface A{
    static var b:Int64  // EXPECTED: regex 'static' modifier is illegal for variable declaration in interface body
}

