// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
    static func c():Unit{} // EXPECTED: regex foreign function can not have body
}

foreign{
    interface B{
        static func c():Unit{} // EXPECTED: regex foreign function can not have body
    }
}
