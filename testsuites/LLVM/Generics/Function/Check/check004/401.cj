package test401

external open class A<X,Y>{
    func test(a:Int64,b:Int64,c:Y){}
    func test(a:Int64,b:Int64,c:X){}
}

external record B<X,Y>{
    func test(a:Int64,b:Int64,c:Y){}
    func test(a:Int64,b:Int64,c:X){}
}

external interface C<X,Y>{
    func test(a:Int64,b:Int64,c:Y){}
    func test(a:Int64,b:Int64,c:X){}
}
