// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Bool):Bool

foreign {
    func bar(a:Bool):Bool
}
