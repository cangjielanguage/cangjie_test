// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    var a:Int64 = 1
    open prop let v: Int64 {
        get() { return a }
    }
}
class B <: A {
    override prop let v: Int64 {
        get() { return super.a + 1 }
    }
}

class C <: A {
    override prop let v: Int64 {
        get() { return a + 1 }
    }
}

func main():Int64 {
    if( A().v != 1) {
        return 1
    }
    if( B().v != 2) {
        return 2
    }
    if( C().v != 2) {
        return 2
    }
    return 0
}
