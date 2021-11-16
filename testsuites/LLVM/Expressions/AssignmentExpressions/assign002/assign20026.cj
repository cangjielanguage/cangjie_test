// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{
    var a :Int32
    init(a:Int32){
        this.a = a
    }
}

open class B <: A{
    init(a: Int32) { super(a) }
}

class C <: B{
    init(a:Int32){ super(a) }
}

func main(): Int64 {
    var l : A = A(1)
    var r : C = C(2)
    l = r
    if (l.a == 2) {
        return 0
    }
    return 1
}
