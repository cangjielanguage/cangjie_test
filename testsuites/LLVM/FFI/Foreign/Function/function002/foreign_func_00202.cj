// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:UInt8):UInt8

foreign {
    func bar(a:UInt8):UInt8
}
