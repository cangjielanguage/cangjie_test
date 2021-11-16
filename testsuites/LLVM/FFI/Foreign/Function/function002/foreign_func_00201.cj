// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Int8):Int8

foreign {
    func bar(a:Int8):Int8
}
