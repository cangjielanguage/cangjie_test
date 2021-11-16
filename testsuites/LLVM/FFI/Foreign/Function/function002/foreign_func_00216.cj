// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Unit):Unit

foreign {
    func bar(a:Unit):Unit
}
