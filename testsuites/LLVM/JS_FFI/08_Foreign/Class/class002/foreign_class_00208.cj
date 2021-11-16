// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign class A{
    func a(input:Float32):Int32  
    func a(input:Int16):Char 
}

foreign{
    class B{
        func a(input:Int16):Int32 
        func a(input:Bool):String 
    }
}
