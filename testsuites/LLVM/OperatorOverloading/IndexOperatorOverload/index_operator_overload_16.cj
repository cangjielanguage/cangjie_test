// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
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

class B {
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

func main(): Int64{
    var index: Int32  = 2
    var a = A(2)
    var b = B(2)
    a[b] = 4
    return 0
}