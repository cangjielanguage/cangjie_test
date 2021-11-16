package pkgs


external func Foo(a!:Int64=1){
        var b: Int64 = Goo()
        return a+b
}

internal func Goo(b!:Int64 =2):Int64{
        return b
}

