// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Float32):Float32

foreign {
    func bar(a:Float32):Float32
}
