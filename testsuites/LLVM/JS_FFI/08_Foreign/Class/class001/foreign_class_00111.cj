// EXEC-PIPE-1:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    private func a():Unit // EXPECTED: regex
    protected func b():Unit // EXPECTED: regex
    open func c():Unit // EXPECTED: regex
    public func d():Unit  // EXPECTED: regex
} 

foreign {
    class B{
        private func a():Unit // EXPECTED: regex
        protected func b():Unit // EXPECTED: regex
        open func c():Unit // EXPECTED: regex
        public func d():Unit // EXPECTED: regex
    }
}
