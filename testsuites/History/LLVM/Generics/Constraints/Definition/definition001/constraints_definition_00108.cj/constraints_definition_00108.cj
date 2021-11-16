// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait T{
    func foo(a:This,b:Int64):Unit
}

append Unit with T{func foo(a:Unit,b:Int64):Unit{}}

func test<X>(a:X) where X <: T{
   a.foo(1)
}

record R<X> where X <: T{
    var i : X
    init(input:X){
        let a : Unit = input.foo(1)
        i = input
    }
}

enum E<X> where X <: T{e}

class C<X> where X <: T{
    init(input:X){
        let a : Unit = input.foo(1)
    }
}

interface I<X> where X <: T{
    //let b : Unit = foo(a)
}

append<X> R<X> with T where X <: T{
    func foo(a:R<X>,b:Int64):Unit{
        a.i.foo(b)
    }
}

func main():Int64{
    test<Unit>(())
    R<Unit>(())
    E<Unit>.e
    C<Unit>(())
    func foo(input:I<Unit>){}
    return 0
}
