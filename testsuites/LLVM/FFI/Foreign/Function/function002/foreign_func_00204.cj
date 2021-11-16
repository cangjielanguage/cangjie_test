// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:UInt16):UInt16

foreign {
    func bar(a:UInt16):UInt16
}
