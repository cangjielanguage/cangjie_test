// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Int64):Int64

foreign {
    func bar(a:Int64):Int64
}
