package pkgs

internal record A{
    static func foo2(){
        return 0
    }
    static var cc = 0
}

external class B{
    var a = A.foo2
    static var b = A.cc
}

extend B{
    func foo1(){
        return a
    }
}
