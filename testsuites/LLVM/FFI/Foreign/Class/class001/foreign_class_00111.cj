// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign class A{
    private func a():Unit
    protected func b():Unit
    open func c():Unit
    public func d():Unit
}

foreign {
    class B{
        private func a():Unit
        protected func b():Unit
        open func c():Unit
        public func d():Unit
    }
}