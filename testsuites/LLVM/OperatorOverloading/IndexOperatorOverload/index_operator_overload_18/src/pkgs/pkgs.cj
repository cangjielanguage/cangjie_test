package pkgs

external class A {
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    public operator func []( index: B, value: Int64): Unit{
        this.b = value
    }
}

external class B {
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    public operator func []( index: B, value: Int64): Unit{
        this.b = value
    }
}