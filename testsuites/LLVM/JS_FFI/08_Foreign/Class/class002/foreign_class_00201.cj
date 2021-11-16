// EXEC-PIPE-1:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    init() // EXPECTED: regex class's constructor or finalizer should have function body
    init(a:Int64) // EXPECTED: regex class's constructor or finalizer should have function body
}

foreign{
    class B{
        init() // EXPECTED: regex class's constructor or finalizer should have function body
        init(a:Int64) // EXPECTED: regex class's constructor or finalizer should have function body
    } 
}
