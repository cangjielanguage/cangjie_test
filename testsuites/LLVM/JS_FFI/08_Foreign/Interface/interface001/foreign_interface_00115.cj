// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{
    func a(z:Bool):Int16
    func a():Int32 
    func b():Int8 
    func b(x:Float64):Int64 
    static func c():Int32 
    static func c(y:Char):Int16
}

foreign{
    interface B{
        func a(z:Bool):Int16
        func a():Int32
        func b():Int8 
        func b(x:Float64):Int64 
        static func c():Int32 
        static func c(y:Char):Int16
    }
}