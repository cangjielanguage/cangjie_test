// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign class A{
    static func a(input:Bool):Int32  
    static func a(input:Int16):Int32 
}

foreign{
    class B{
        static func a(input:Int16):Int32  
        static func a(input:Int64):Int32  
    } 
}
