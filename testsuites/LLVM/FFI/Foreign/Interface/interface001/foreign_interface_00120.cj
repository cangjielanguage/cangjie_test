// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{
    func test():Int64
}

foreign{
interface B{
    func test():Int64
}
}

class C <: A{
    func test():Int64 {
        return 1
    }
}
class D <: B{
    func test():Int64 {
        return 1
    }
}

var a = C().test()
var b = D().test()