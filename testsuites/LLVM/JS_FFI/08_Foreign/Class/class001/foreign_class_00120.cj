// EXEC-PIPE-1:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    var a : Int64
    public var b : Int64  // EXPECTED: regex
    private var c : Int64 // EXPECTED: regex
    protected var d : Int64 // EXPECTED: regex
}
foreign{
    class B{
        var a : Int64
        public var b : Int64 // EXPECTED: regex
        private var c : Int64 // EXPECTED: regex
        protected var d : Int64 // EXPECTED: regex
    }
}
