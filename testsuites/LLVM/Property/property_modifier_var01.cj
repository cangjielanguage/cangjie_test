// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    var a:Int64 = 1
    open prop var i: Int64 {
        get() { return a }
        set(v){ a = v}
    }
}
class B <: A {
    override prop var i: Int64 {
        get() { return a * 2 }
    }
}

func main():Int64 {
    var a = A()
    a.i = 2
    if ( a.i != 2 ){
        return 1
    }
    var b = B()
    b.i = 2
    if ( b.i != 4 ){
        return 2
    }
    return 0
}