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


func main():Int64 {
    if ( B().i != 1) {
        return 1
    }
    if ( A().i != 1) {
        return 0
    }
    return 0
}
