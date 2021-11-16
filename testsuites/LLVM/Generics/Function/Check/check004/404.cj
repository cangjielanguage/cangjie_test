package test404

external open class A<X,Y>{
    static func test(a:Int64,b:Int64,c:Y){}
    static func test(a:Int64,b:Int64,c:X){}
}

external record B<X,Y>{
    static func test(a:Int64,b:Int64,c:Y){}
    static func test(a:Int64,b:Int64,c:X){}
}

external interface C<X,Y>{
    static func test(a:Int64,b:Int64,c:Y){}
    static func test(a:Int64,b:Int64,c:X){}
}
