package pkgs

external class A{
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    public operator func [](index: Int64): Int64{
        if (index > 1) {
            3
        } else {
            this.a
        }
    }
    public operator func []( index: Int64, value: Int64): Unit{
        this.b = value
    }
}
