// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// var-set
open class A {
    var a:Int64 = 1
    open prop var i: Int64 {
        get() { return 1 }
        set(v){}
    }
}
class B <: A {
    override prop var i: Int64 {
        set(v){}
    }
}

func main():Int64 {
    if( A().i != 1) {
        return 3
    }
    if( B().i != 1) {
        return 4
    }
    return 0
}
