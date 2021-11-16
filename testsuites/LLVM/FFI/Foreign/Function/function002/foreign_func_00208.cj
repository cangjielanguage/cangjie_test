// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:UInt64):UInt64

foreign {
    func bar(a:UInt64):UInt64
}
