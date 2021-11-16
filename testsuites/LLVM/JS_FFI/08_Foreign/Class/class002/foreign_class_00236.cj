// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A {
    private var a = 0
    prop var b: Int64 {
        get() {     // EXPECTED: regex foreign function can not have body
            print("get")
            a
        }
        set(value) { // EXPECTED: regex foreign function can not have body
            print("set")
            a = value
        }
    }
}

