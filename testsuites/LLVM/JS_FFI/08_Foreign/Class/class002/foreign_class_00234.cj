// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class B{
    func b(input:Int16):Int32{1}
}

foreign class A <:B {
    func a(input:Int16):Int32 // EXPECTED: regex xxx
}

