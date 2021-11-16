// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:UInt32):UInt32

foreign {
    func bar(a:UInt32):UInt32
}
