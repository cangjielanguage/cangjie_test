// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Float64):Float64

foreign {
    func bar(a:Float64):Float64
}
