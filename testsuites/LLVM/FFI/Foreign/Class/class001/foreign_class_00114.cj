// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

abstract class A{
    open func foo():Unit{}
}
/*
abstract class B{
    open func foo():Unit // error
}

foreign abstract class C{
    open func foo():Unit
}
*/

foreign class D{
    open func foo():Unit
}

class E{
    open func foo():Unit{}
}

abstract class B{
    func foo():Unit
}

foreign abstract class C{
    func foo():Unit
}
