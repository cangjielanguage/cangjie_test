// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    open prop let v: Int64 {
        get() { return 1 }
    }
}

class B <: A {
    override prop let v: Int64 {
        get() { return super.v + 1 }
    }
}

func main() {
    var ret = B()
    if ( ret.v != 2) {
        return 1
    }
    return 0
}