// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign class A{
    static func test():Int32
}

foreign{
    class B{
        static func test():Int32
    }
}

var x  = A.test()
var y  = B.test()