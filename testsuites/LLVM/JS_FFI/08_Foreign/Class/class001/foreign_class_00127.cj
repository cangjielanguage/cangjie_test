// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    static func foo():Unit{} // EXPECTED: regex foreign function can not have body
}

foreign{
    class B{
        static func foo():Unit{} // EXPECTED: regex foreign function can not have body
    }
}

