// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign class A{
    static var a : Int32
}


foreign{
class B{
    static var a : Int32
}
}

var x  = A.a
var y  = B.a