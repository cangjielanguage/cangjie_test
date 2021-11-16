// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    open prop var i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}

class B <: A {
    override prop var i: Int64 {
        get() { return 1 }
        set(v) {}
    }
}

func main() {
    var res = A()
    if (  res.i != 0 ) {
        return 1
    }
    var ret = B()
    if ( ret.i != 1 ) {
        return 1
    }
    return 0
}