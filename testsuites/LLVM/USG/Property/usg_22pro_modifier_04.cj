// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    open prop var i1: Int64 {
        get() { return 0 }
        set(v) {}
    }
}


class B <: A {
    override prop var i1: Int64 {
        get() { return 1 }
    }
}


class C <: A {
    override prop var i1: Int64 {
        set(v) {}
    }
}


func main() {
    var ret_A = A()
    if ( ret_A.i1 != 0 ) {
        return 1
    }
    var ret_B = B()
    if ( ret_B.i1 != 1 ) {
        return 1
    }
    var ret_C = C()
    ret_C.i1 = 666
    return 0
}