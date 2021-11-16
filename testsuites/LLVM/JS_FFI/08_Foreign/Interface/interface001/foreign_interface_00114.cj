// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{
    func a(z:Bool):Int16
    func a():Int16 
    func b():Int8 
    func b(x:Float64):Int8 
    static func c():Int32 
    static func c(y:Char):Int32
}

foreign{
    interface B{
        func a(z:Bool):Int16
        func a():Int16 
        func b():Int8 
        func b(x:Float64):Int8 
        static func c():Int32 
        static func c(y:Char):Int32
    }
}