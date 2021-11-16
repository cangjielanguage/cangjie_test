// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Int16):Int16

foreign {
    func bar(a:Int16):Int16
}
