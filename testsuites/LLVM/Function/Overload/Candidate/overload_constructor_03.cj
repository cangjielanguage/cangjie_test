// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = foo2(2)
    if ( a.a2 != 2 ) {
        return 1
    }
    var b = foo3(Int32(3))
    if ( b.a3 != 6 ) {
        return 2
    }
    return 0
}

open class foo1 {
    var a1: Int64 = 1
    foo1(x:Int64){
        a1 = Int64(x)
    }
    init(x:Int32){
        a1 = Int64(x) + 1
    }
}

open class foo2 <: foo1 {
    var a2: Int64 = 1
    foo2(x:Int64){
        super(x)
        a2 = super.a1
    }
    init(x:Int32){
        super(x)
        a2 = super.a1 + 1
    }
}

class foo3 <: foo2 {
    var a3: Int64 = 1
    foo3(x:Int64){
        super(x)
        a3 = super.a2
    }
    init(x:Int32){
        super(x)
        a3 = super.a2 + 1
    }
}
