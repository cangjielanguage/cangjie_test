// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

abstract foreign class A{
    func a(input:Int16):Int16  
    func a(input:Int8):Int32  
}
