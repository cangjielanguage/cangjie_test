// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign class A{
    func a(input:Int16):Int32  
    func a(input:Int32):Int32  
}

foreign{
    class B{
        func a(input:Int16):Int32  
        func a(input:Int32):Int32  
    }
}
