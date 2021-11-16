// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

func foo(a:Int32):Unit{}


foreign{
    func foo():Unit
}