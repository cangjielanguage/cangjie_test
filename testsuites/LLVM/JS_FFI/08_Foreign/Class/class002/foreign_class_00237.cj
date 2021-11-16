// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A {
    static private var a = 0
    static prop var b: Int64 {
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

