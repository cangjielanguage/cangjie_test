// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

abstract foreign class A{
    func a():Unit  
    func a(x:Int32):Unit  
}
