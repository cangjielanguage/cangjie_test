// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Float16):Float16

foreign {
    func bar(a:Float16):Float16
}
