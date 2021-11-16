// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{
    var a :Int32
    init(a:Int32){
        this.a = a
    }
}

class B <: A{
    init(a:Int32){
        super(a)
    }
}

func main(): Int64 {
    var l : A = A(1)
    var r : B = B(2)
    l = r
    if (l.a == 2) {
        return 0
    }
    return 1
}
