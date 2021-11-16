// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// var-get
open class A {
    var a:Int64 = 1
    open prop var i: Int64 {
        get() { return 1 }
        set(v){}
    }
}
class B <: A {
    override prop var i: Int64 {
        get() { return 2 }
    }
}


// var-set
open class C {
    var a:Int64 = 1
    open prop var i: Int64 {
        get() { return a }
        set(v){ a = v  }
    }
}
class D <: C {
    override prop var i: Int64 {
        set(v){ a = v + 1 }
    }
}

func main():Int64 {
    var a = A()
    a.i = 1
    if ( a.i != 1 ){
        return 1
    }
    var b = B()
    b.i = 2
    if ( b.i != 2 ){
        return 2
    }

    var c = C()
    c.i = 2
    if ( c.i != 2 ){
        return 3
    }
    var d = D()
    d.i = 2
    if ( d.i != 3 ){
        return 4
    }

    return 0
}
